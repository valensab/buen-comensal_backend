from email.base64mime import body_decode
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from users.models import Commensal, User
from django.contrib.auth import authenticate
from users.api.serializers import CommensalSerializer, UserCommensalSerializer, UserTokenSerializer, UserFieldSerializer, UpdateInfoCommensalSerializer
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken


# Create your views here.
class RegisterCommensal(APIView):

    def post(self, request, *args, **kwargs):
        serializer_commensal = CommensalSerializer(data=request.data)
        if serializer_commensal.is_valid():
            serializer_commensal.save()
            return Response({"code": 1}, status=status.HTTP_201_CREATED)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)


class LoginCommensal(ObtainAuthToken):
    serializer_class = UserTokenSerializer

    def post(self, request, *args, **kwargs):
        # send to serializer username and password
        login_serializer = self.serializer_class(
            data=request.data, context={'request': request})
        if login_serializer.is_valid():
            # login serializer return user in validated_data
            print(login_serializer.data)
            email = login_serializer.data['email'].lower()
            password = login_serializer.data['password']
            user = authenticate(username=email, password=password)
            # print(user)
            print(user)
            if user is not None and user.is_active and user.is_commensal:
                token, created = Token.objects.get_or_create(user=user)
                user_serializer = UserFieldSerializer(user)
                commensal = Commensal.objects.filter(
                    user_id=user_serializer.data['id']).first()
                print(commensal)
                if created:
                    return Response({
                        'token': token.key,
                        'id_user': user_serializer.data['id'],
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'last_name':  user_serializer.data['last_name'],
                        'phone_number': commensal.phone_number,
                        'new': commensal.new,
                        'age': commensal.age,
                        'id_commensal': commensal.id_commensal,
                        'code': 1
                    }, status=status.HTTP_201_CREATED)
                else:
                    token.delete()
                    token = Token.objects.create(user=user)
                    return Response({
                        'token': token.key,
                        'id_user': user_serializer.data['id'],
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'last_name':  user_serializer.data['last_name'],
                        'phone_number': commensal.phone_number,
                        'new': commensal.new,
                        'age': commensal.age,
                        'id_commensal': commensal.id_commensal,
                        'code': 1
                    }, status=status.HTTP_201_CREATED)

            else:
                return Response({'code': 2},
                                status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'code': 3},
                            status=status.HTTP_401_UNAUTHORIZED)


class UserToken(APIView):
    def post(self, request, *args, **kwargs):
        try:
            user_id = request.data['user_id']
            token = request.data['token']
            print(user_id)
            token_filter = Token.objects.filter(user_id=user_id, key = token).first()
            print(token_filter)
            if token_filter:
                commensal = Commensal.objects.filter(user_id=user_id).first()
                print(commensal)
                user = User.objects.filter(id=user_id).first()
                print(user)
                return Response({
                    'token': token_filter.key,
                    'id_user': user.id,
                    'email': user.email,
                    'name': user.name,
                    'last_name':  user.last_name,
                    'phone_number': commensal.phone_number,
                    'new': commensal.new,
                    'age': commensal.age,
                    'id_commensal': commensal.id_commensal,
                    'code': 1
                }, status=status.HTTP_200_OK)
            else:
                return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)

class Logout(APIView):
    
    def post(self,request,*args,**kwargs):
        try:
            user_id = request.data['user_id']
            token = Token.objects.filter(user_id = user_id).first()
            if token:
                user = token.user
                token.delete() 
                return Response({'code':1}, status = status.HTTP_200_OK)
            
            return Response({'code':2},
                    status = status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'code':2}, 
                                    status = status.HTTP_409_CONFLICT)


class CommensalUpdateAPIView(APIView):      
    def put(self, request, format=None):
        pk = request.data['user']
        commensal = Commensal.objects.filter(id_commensal = pk).first()        
        serializer_commensal = UpdateMenuRestaurantSerializer(restaurant, data=request.data)
        if serializer_restaurant.is_valid():
            serializer_restaurant.save()
            return Response({"code": 1}, status=status.HTTP_201_CREATED)
        return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)