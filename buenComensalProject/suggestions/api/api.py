from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant
from suggestions.models import Score, Comments
from restaurants.api.serializers import RestaurantFieldSerializer, RestaurantInfoSerializer
from suggestions.api.serializers import ScoreSerializer, CommentsSerializer, ScoreAllSerializer, CommentsAllSerializer


@api_view(['GET'])
def score_list(request):

    if request.method == 'GET':
        score = Score.objects.all()
        score_serializer = ScoreAllSerializer(score, many=True)
        return Response(score_serializer.data, status=status.HTTP_200_OK)
    else:
        return Response({'code':3},status = status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def score_list_restaurant(request):
    if request.method == 'GET':
        restaurant_score = Score.objects.filter(id_restaurant=request.data['id_restaurant'])
        score_count = Score.objects.filter(id_restaurant=request.data['id_restaurant']).count()
        restaurant_serializer = ScoreAllSerializer(restaurant_score, many=True)
        if score_count == 0:
            return Response({'message': 'No hay calificaciones para este usuario'},status = status.HTTP_200_OK)
        else: 
            return Response(restaurant_serializer.data,status = status.HTTP_200_OK)

    else:
        return Response({'code':3},status = status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def comments_list_restaurant(request):
    if request.method == 'GET':
        user_score = Comments.objects.filter(id_user=request.data['id_user'])
        score_count = Comments.objects.filter(id_user=request.data['id_user']).count()
        user_serializer = CommentsAllSerializer(user_score, many=True)
        if score_count == 0:
            return Response({'message': 'No hay calificaciones para este usuario'},status = status.HTTP_200_OK)
        else: 
            return Response(user_serializer.data,status = status.HTTP_200_OK)

    else:
        return Response({'code':3},status = status.HTTP_400_BAD_REQUEST)