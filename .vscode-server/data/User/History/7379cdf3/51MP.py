from email.base64mime import body_decode
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from users.models import Commensal, User
from django.contrib.auth import authenticate
from users.api.serializers import CommensalSerializer, UserCommensalSerializer, UserTokenSerializer, UserFieldSerializer
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken


# Create your views here.
class RegisterCommensal(APIView):

    def post(self, request,*args,**kwargs):
        serializer_commensal = CommensalSerializer(data= request.data.dict())
        if serializer_commensal.is_valid():
            serializer_commensal.save()    
            return Response({"message": "Usuario registrado con éxito"}, status=status.HTTP_201_CREATED)
        else: 
            return Response(serializer_commensal.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginCommensal(ObtainAuthToken):
    serializer_class = UserTokenSerializer
    def post(self,request,*args,**kwargs):
        # send to serializer username and password
        login_serializer = self.serializer_class(data = request.data, context = {'request':request})
        if login_serializer.is_valid():
            # login serializer return user in validated_data
            print(login_serializer.data)
            email = login_serializer.data['email']
            password = login_serializer.data['password']
            user = authenticate(username=email, password=password)
            #print(user)
            print(user)
            if user is not None and user.is_active:
                token,created = Token.objects.get_or_create(user = user)
                user_serializer = UserFieldSerializer(user)
                commensal = Commensal.objects.filter(user_id = user_serializer.data['id']).first()
                if created:
                    return Response({
                        'token': token.key,
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'last_name':  user_serializer.data['last_name'],
                        'id_commensal': commensal.id_commensal,
                        'phone_number': commensal.phone_number,
                        'date_birth': commensal.date_birth,
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                else:
                    token.delete()
                    token = Token.objects.create(user = user)
                    return Response({
                        'token': token.key,
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'last_name':  user_serializer.data['last_name'],
                        'id_commensal': commensal.id_commensal,
                        'phone_number': commensal.phone_number,
                        'date_birth': commensal.date_birth,
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                  
            else:
                return Response({'error': 'Nombre de usuario o contraseña incorrectos.'},
                                    status = status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error':'Este usuario no puede iniciar sesión.'}, 
                                    status = status.HTTP_401_UNAUTHORIZED)


class UserToken(APIView):
    def post(self,request, *args,**kwargs):    
        try:      
            user_id = request.data['user_id']
            print(user_id)
            token = Token.objects.filter(user_id = user_id).first()
            print(token)
            if token:
                return Response({'is_validate': 1}, status = status.HTTP_200_OK)
            else:
                return Response({'is_validate': 2}, status = status.HTTP_200_OK)
        except:
            return Response({'Peticion inválida'}, status = status.HTTP_400_BAD_REQUEST)