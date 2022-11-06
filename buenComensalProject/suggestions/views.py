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

# Ingresar calificaciones para restaurante


class ScoreRegister(APIView):
    def post(self, request, *args, **kwargs):
        sum = 0
        serializer = ScoreSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(user=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(id_restaurant=id_restaurant, user__is_restaurant=True).first()
        if commensal is not None and restaurant is not None:
            score = Score.objects.filter(id_restaurant=restaurant.id_restaurant, id_user=commensal.user).first()
            if score == None:
                if serializer.is_valid():
                    serializer.save()
                    restaurant_punctuation = Score.objects.filter(id_restaurant=id_restaurant)
                    for rest in restaurant_punctuation:
                        sum = sum + rest.punctuation
                    restaurant.punctuation = round(sum / len(restaurant_punctuation))
                    restaurant.save()
                    print(round(sum / len(restaurant_punctuation)))
                    return Response({"code": 1}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)

# Ingresar comentarios


class CommentsRegister(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CommentsSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(
            user=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(
            id_restaurant=id_restaurant, user__is_restaurant=True).first()
        if commensal is not None and restaurant is not None:
            comments = Comments.objects.filter(
                id_restaurant=restaurant.id_restaurant, id_user=commensal.user).first()
            if comments is None:
                if serializer.is_valid():
                    serializer.save()
                    return Response({"code": 1}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)

 # Seleccionar como favorito


class FavoriteRegister(APIView):
    def post(self, request, *args, **kwargs):
        serializer_favorite = FavoriteSerializer(data=request.data)
        id_user = request.data['id_user']
        id_restaurant = request.data['id_restaurant']
        commensal = Commensal.objects.filter(
            user=id_user, user__is_commensal=True).first()
        restaurant = Restaurant.objects.filter(
            id_restaurant=id_restaurant, user__is_restaurant=True).first()
        user_favorites = Favorites.objects.filter(
            id_restaurant=restaurant.id_restaurant, id_user=commensal.user).first()
        print(commensal.id_commensal, restaurant.id_restaurant)
        if commensal is not None and restaurant is not None:
            if user_favorites is None:
                if serializer_favorite.is_valid():
                    serializer_favorite.save()
                    return Response({"code": 1}, status=status.HTTP_201_CREATED)
                else:
                    return Response(serializer_favorite.errors, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)
