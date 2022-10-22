from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant
from restaurants.api.serializers import RestaurantFieldSerializer, ImagenListSerializer, TagsListSerializer, RestaurantInfoSerializer


@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        users = Restaurant.objects.all()
        users_serializer = RestaurantFieldSerializer(users, many=True)
        return Response(users_serializer.data, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def restaurants_list_10(request):
    list = []
    if request.method == 'GET':
        restaurant = Restaurant.objects.all()[:10]
        restaurants_serializer = RestaurantInfoSerializer(
            restaurant, many=True)
        for restaurant in restaurants_serializer.data:
            print(restaurant.get('id_restaurant'))
            if restaurant.get('is_restaurant') == True and restaurant.get('is_active'):
                list.append({'id_restaurant': restaurant.get('id_restaurant'), 'name': restaurant.get('name')})
        
        return Response(list, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def imagen_list(request, pk=None):
    if request.method == 'GET':
        images = GalleryRestaurant.objects.filter(restaurant=pk)
        imagen_count = GalleryRestaurant.objects.filter(restaurant=pk).count()
        imagen_serializer = ImagenListSerializer(images, many=True)
        if imagen_count == 0:
            return Response({'message': 'No hay imágenes en este restaurante '}, status=status.HTTP_200_OK)
        else:
            data = {
                'Número de imágenes': imagen_count,
                "Imágenes": imagen_serializer.data,
            }
            return Response(data, status=status.HTTP_200_OK)
    else:
        return Response({'Solo se soporta método GET'}, status=status.HTTP_400_BAD_REQUEST)

# @api_view(['GET'])
# def tags_list(request):

#     if request.method == 'GET':
#         tags = TagsRestaurant.objects.all()
#         tags_serializer = TagsSerializer(tags, many=True)
#         return Response(tags_serializer.data, status=status.HTTP_200_OK)

#     else:
#         return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def tags_list_user(request, pk=None):

    if request.method == 'GET':
        tags = TagsRestaurant.objects.filter(restaurant=pk)
        tags_serializer = TagsListSerializer(tags, many=True)
        return Response(tags_serializer.data, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
def tags_user_delete(request, pk=None):

    tags = TagsRestaurant.objects.filter(id_tags=pk)
    if tags:
        if request.method == 'DELETE':
            tags.delete()
            return Response({"code": 1}, status=status.HTTP_200_OK)
    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
def imagen_delete(request, pk=None):

    imagen = GalleryRestaurant.objects.filter(id_imagen=pk).first()
    print(pk)
    if imagen:
        if request.method == 'DELETE':
            imagen.delete()
            return Response({'message': 'La imagen fue eliminada correctamente!'}, status=status.HTTP_200_OK)

    return Response({'message': 'No se ha encontrado ninguna imagen con estos datos'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def restaurant_recommender(request):

    if request.method == 'GET':
        users = Restaurant.objects.filter(
            id_restaurant__in=[1, 2], user__is_active=True)
        users_serializer = RestaurantFieldSerializer(users, many=True)
        return Response(users_serializer.data, status=status.HTTP_200_OK)
    else:
        return Response({'No se encontraron restaurantes'}, status=status.HTTP_400_BAD_REQUEST)
