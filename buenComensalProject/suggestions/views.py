from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import ListAPIView
from rest_framework import filters
from rest_framework import generics
from django.shortcuts import render
from suggestions.api.serializers import ScoreSerializer, CommentsSerializer, FavoriteSerializer
from users.models import Commensal
from restaurants.models import Restaurant, TagsRestaurant
from suggestions.models import Comments, Score, Favorites
# Create your views here.


class ScoreRegister(APIView):
    def post(self, request, *args, **kwargs):
        sum = 0
        serializer = ScoreSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(id_commensal=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(id_restaurant=id_restaurant, user__is_restaurant=True).first()
        score = Score.objects.filter(id_restaurant=id_restaurant, id_user=id_user).first()
        if commensal != None:
            if restaurant != None:
                print(score)
                if score == None:
                    if serializer.is_valid():
                        serializer.save()
                        restaurant_punctuation = Score.objects.filter(id_restaurant=id_restaurant)
                        for rest in restaurant_punctuation:
                            sum = sum + rest.punctuation
                        restaurant.punctuation = round(sum /len(restaurant_punctuation))
                        restaurant.save()
                        print(round(sum /len(restaurant_punctuation)))
                        return Response({"code": 1}, status=status.HTTP_201_CREATED)
                    else:
                        return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)


class CommentsRegister(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CommentsSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(id_commensal=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(id_restaurant=id_restaurant, user__is_restaurant=True).first()
        comments = Comments.objects.filter(id_restaurant=id_restaurant, id_user=id_user).first()
        if commensal != None:
            if restaurant != None:
                if comments == None:
                    if serializer.is_valid():
                        serializer.save()
                        return Response({"code": 1}, status=status.HTTP_201_CREATED)
                    else:
                        return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)


class FavoriteRegister(APIView):
    def post(self, request, *args, **kwargs):
        serializer = FavoriteSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(id_commensal=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(id_restaurant=id_restaurant, user__is_restaurant=True).first()
        favorites = Favorites.objects.filter(id_restaurant=id_restaurant, id_user=id_user).first()
        if commensal != None:
            if restaurant != None:
                if favorites:
                   return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    if serializer.is_valid():
                        serializer.save()
                        return Response({"code":1}, status=status.HTTP_201_CREATED)    
                    else:
                        return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)  
            else:
                return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   
        else:
            return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)   

 