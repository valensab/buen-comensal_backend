from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant, GalleryRestaurant
from suggestions.models import Favorites, Score, Comments
from restaurants.api.serializers import RestaurantFieldSerializer, RestaurantInfoSerializer, ImagenListSerializer
from suggestions.api.serializers import ScoreSerializer, CommentsSerializer, ScoreAllSerializer, CommentsAllSerializer, FavoritesAllSerializer, CommentsForRestaurantSerializer
from suggestions.views import FavoriteRegister


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
        restaurant_score = Score.objects.filter(id_restaurant=pk, id_restaurant__new=False)
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
        user_score = Comments.objects.filter(id_user=pk, id_restaurant__new=False)
        score_count = Comments.objects.filter(id_user=pk, id_restaurant__new=False).count()
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
                             'imagen': images.imagen.url if images.imagen != '' else ''
                             })

            return Response({'comments': list}, status=status.HTTP_200_OK)

    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)


def imagen_list_all(pk):

    images = GalleryRestaurant.objects.filter(restaurant=pk)
    imagen_serializer = ImagenListSerializer(images, many=True)
    return imagen_serializer.data

@api_view(['GET'])
def comments_restaurant(request, pk=None):
    if request.method == 'GET':
        list = []
        user_score = Comments.objects.filter(id_restaurant=pk, id_restaurant__new=False)
        score_count = Comments.objects.filter(id_restaurant=pk, id_restaurant__new=False).count()
        user_serializer = CommentsForRestaurantSerializer(user_score, many=True)

        if score_count == 0:
            return Response({'message': 'No hay sugerencias para este restaurante'}, status=status.HTTP_200_OK)
        else:
            for restaurant in user_serializer.data:
                list.append({'commensal': restaurant.get('commensal'),
                            'last_name': restaurant.get('last_name'),
                            'comment': restaurant.get('comment'),
                            'date': restaurant.get('date'),
                             })

            return Response({'suggestions': list}, status=status.HTTP_200_OK)

    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)




@api_view(['GET'])
def favorites_list_restaurant(request, pk=None):
    if request.method == 'GET':
        list = []
        user_favorite = Favorites.objects.filter(
            id_user=pk, id_restaurant__new=False)
        favorite_count = Favorites.objects.filter(
            id_user=pk, id_restaurant__new=False).count()
        user_serializer = FavoritesAllSerializer(user_favorite, many=True)

        if favorite_count == 0:
            return Response({'restaurants': []}, status=status.HTTP_200_OK)
        else:
            for restaurant in user_serializer.data:
                images = imagen_list_all(restaurant.get('id_restaurant'))
                list.append({'id_restaurant': restaurant.get('id_restaurant'),
                             'name': restaurant.get('name'),
                             'punctuation': restaurant.get('punctuation'),
                             'address': restaurant.get('address'),
                             'prices': restaurant.get('prices'),
                             'type_food': restaurant.get('type_food'),
                             'menu': restaurant.get('menu'),
                             'schedule': restaurant.get('schedule'),
                             'description': restaurant.get('description'),
                             'images': images,
                             'id_favorite': restaurant.get('id_favorite')
                             })

            return Response({'restaurants': list}, status=status.HTTP_200_OK)

    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
def favorites_delete(request):
    id_user = request.query_params.get('id_user')
    id_restaurant =  request.query_params.get('id_restaurant')
    favorite = Favorites.objects.filter(id_restaurant = id_restaurant, id_user=id_user, favorite=True).first()
    if favorite:
        if request.method == 'DELETE':
            favorite.delete()
            return Response({'code': 1}, status=status.HTTP_200_OK)
        else: 
            Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
    return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
