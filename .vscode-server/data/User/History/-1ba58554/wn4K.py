from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import ListAPIView
from rest_framework import filters
from rest_framework import generics
from django.shortcuts import render
from suggestions.api.serializers import ScoreSerializer
from users.models import Commensal
from restaurants.models import Restaurant
# Create your views here.
class ScoreRegister(APIView):
    def post(self, request,*args,**kwargs):
        serializer = ScoreSerializer(data= request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(id_commensal = id_user, user__is_commensal = True).first()
        restaurant = Restaurant.objects.filter(id_restaurant = id_restaurant, user__is_restaurant = True).first()
        if commensal != 'None':
            if restaurant != 'None':
                if serializer.is_valid():
                    serializer.save()
                    return Response({"code":1}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   
            else:
                return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   
        else:
            return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   


class CommentsRegister(APIView):
    def post(self, request,*args,**kwargs):
        serializer = ScoreSerializer(data= request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        comment = request.data['comment']
        commensal = Commensal.objects.filter(id_commensal = id_user, user__is_commensal = True).first()
        restaurant = Restaurant.objects.filter(id_restaurant = id_restaurant, user__is_restaurant = True).first()
        if commensal != 'None':
            if restaurant != 'None':
                if serializer.is_valid():
                    serializer.save()
                    return Response({"code":1}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   
            else:
                return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   
        else:
            return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   