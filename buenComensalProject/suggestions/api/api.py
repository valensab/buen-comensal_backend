from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant, GalleryRestaurant
from suggestions.models import Score, Comments
from restaurants.api.serializers import RestaurantFieldSerializer, RestaurantInfoSerializer, ImagenListSerializer
from suggestions.api.serializers import ScoreSerializer, CommentsSerializer, ScoreAllSerializer, CommentsAllSerializer


@api_view(['GET'])
def score_list(request):

    if request.method == 'GET':
        score = Score.objects.all()
        score_serializer = ScoreAllSerializer(score, many=True)
        return Response(score_serializer.data, status=status.HTTP_200_OK)
    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def score_list_restaurant(request, pk=None):
    if request.method == 'GET':
        restaurant_score = Score.objects.filter(
            id_restaurant=pk, id_restaurant__new=False)
        print(pk)
        score_count = Score.objects.filter(
            id_restaurant=pk, id_restaurant__new=False).count()
        restaurant_serializer = ScoreAllSerializer(restaurant_score, many=True)
        if score_count == 0:
            return Response({'message': 'No hay calificaciones para este restaurante'}, status=status.HTTP_200_OK)
        else:

            return Response({'califications': restaurant_serializer.data}, status=status.HTTP_200_OK)

    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)


def imagen_list(pk):

    images = GalleryRestaurant.objects.filter(restaurant=pk).first()
    #imagen_serializer = ImagenListSerializer(images, many=True)
    return images


@api_view(['GET'])
def comments_list_restaurant(request, pk=None):
    if request.method == 'GET':
        list = []
        user_score = Comments.objects.filter(
            id_user=pk, id_restaurant__new=False)
        score_count = Comments.objects.filter(
            id_user=pk, id_restaurant__new=False).count()
        user_serializer = CommentsAllSerializer(user_score, many=True)

        if score_count == 0:
            return Response({'message': 'No hay calificaciones de este usuario'}, status=status.HTTP_200_OK)
        else:
            for restaurant in user_serializer.data:
                images = GalleryRestaurant.objects.filter(restaurant=restaurant.get('id_restaurant')).first()
                print(type(images.imagen))
                list.append({'id_restaurant': restaurant.get('id_restaurant'),
                             'name': restaurant.get('name'),
                             'punctuation': restaurant.get('punctuation'),
                             'comment': restaurant.get('comment'),
                             'date': restaurant.get('date'),
                             'imagen' : images.imagen.url if images.imagen != '' else ''
                             })

            return Response({'comments': list}, status=status.HTTP_200_OK)

    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)
