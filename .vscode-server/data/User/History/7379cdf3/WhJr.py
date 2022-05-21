from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate
from restaurants.api.serializers import RestaurantSerializer, CommensalSerializer, UserTokenSerializer, UserFieldSerializer
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken


# Create your views here.
class RegisterCommensal(APIView):
    def post(self, request,*args,**kwargs):
        serializer = CommensalSerializer(data= request.data.dict())
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Usuario registrado con éxito"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   


class Login(APIView):
    serializer_class = UserTokenSerializer
    def post(self,request,*args,**kwargs):

        login_serializer = self.serializer_class(data = request.data, context = {'request':request})
        if login_serializer.is_valid():
            # login serializer return user in validated_data
            email = login_serializer.data['email']
            password = login_serializer.data['password']
            user = authenticate(username=email, password=password)
            if user is not None and user.is_active:
                token,created = Token.objects.get_or_create(user = user)
                user_serializer = UserFieldSerializer(user)
                if created and user.serializer.data['is_restaurant']:
                    return Response({
                        'token': token.key,
                        #'user':user_serializer.data,
                        'id': user_serializer.data['id'],
                        'name': user_serializer.data['name'],
                        'email': user_serializer.data['email'],
                        'is_commensal': user_serializer.data['is_commensal'],
                        'is_restaurant': user_serializer.data['is_R'],
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                else:
                    token.delete()
                    token = Token.objects.create(user = user)
                    return Response({
                        'token': token.key,
                        #'user':user_serializer.data,
                        'id': user_serializer.data['id'],
                        'name': user_serializer.data['name'],
                        'email': user_serializer.data['email'],
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                  
            else:
                return Response({'error':'Este usuario no puede iniciar sesión.'}, 
                                    status = status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'error': 'Nombre de usuario o contraseña incorrectos.'},
                                    status = status.HTTP_400_BAD_REQUEST)


class Logout(APIView):
    
    def get(self,request,*args,**kwargs):
        try:
            token = request.GET.get('token')
            token = Token.objects.filter(key = token).first()

            if token:
                user = token.user
                token.delete() 
                token_message = 'Token eliminado.'
                return Response({'token_message': token_message,}, status = status.HTTP_200_OK)
            
            return Response({'error':'No se ha encontrado un usuario con estas credenciales.'},
                    status = status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'error': 'No se ha encontrado token en la petición.'}, 
                                    status = status.HTTP_409_CONFLICT)