from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from users.models import Commensal
from suggestions.models import Score
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant
from restaurants.api.serializers import RestaurantFieldSerializer, ImagenListSerializer, TagsSerializer, TagsListSerializer, RestaurantInfoSerializer, SearchSerializer, SearchSerializerRestaurant
from django.db.models import Q
from iteration_utilities import unique_everseen
from buenComensalProject.recommender import recommender

# Lista de restaurantes


@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        users = Restaurant.objects.all()
        users_serializer = RestaurantFieldSerializer(users, many=True)
        return Response(users_serializer.data, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Lista de imagenes por restaurante


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

# Listas para filtrar


def imagen_list_10(pk):

    images = GalleryRestaurant.objects.filter(restaurant=pk)
    imagen_serializer = ImagenListSerializer(images, many=True)
    return imagen_serializer.data


def imagen_list(pk):

    images = GalleryRestaurant.objects.filter(restaurant=pk)
    imagen_serializer = ImagenListSerializer(images, many=True)
    return imagen_serializer.data

# Lista de los restaurantes más recientes


@api_view(['GET'])
def restaurants_list_10(request):
    list = []
    if request.method == 'GET':
        restaurant = Restaurant.objects.filter(
            new=False).order_by('-id_restaurant')[:10]
        restaurants_serializer = RestaurantInfoSerializer(
            restaurant, many=True)
        for restaurant in restaurants_serializer.data:
            images = imagen_list_10(restaurant.get('id_restaurant'))
            list.append({'id_restaurant': restaurant.get('id_restaurant'),
                         'name': restaurant.get('name'),
                         'menu': restaurant.get('menu'),
                         'address': restaurant.get('address'),
                         'prices': restaurant.get('prices'),
                         'type_food': restaurant.get('type_food'),
                         'punctuation': restaurant.get('punctuation'),
                         'schedule': restaurant.get('schedule'),
                         'description': restaurant.get('description'),
                         'images': images})

        restaurants = {"restaurants": list}
        return Response(restaurants, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Lista de los restaurantes por puntuación más alta


@api_view(['GET'])
def restaurants_list_punctuation(request):
    list = []
    if request.method == 'GET':
        restaurant = Restaurant.objects.filter(
            new=False).order_by('-punctuation')[:10]
        restaurants_serializer = RestaurantInfoSerializer(
            restaurant, many=True)
        for restaurant in restaurants_serializer.data:
            images = imagen_list_10(restaurant.get('id_restaurant'))
            list.append({'id_restaurant': restaurant.get('id_restaurant'),
                         'name': restaurant.get('name'),
                         'menu': restaurant.get('menu'),
                         'address': restaurant.get('address'),
                         'prices': restaurant.get('prices'),
                         'type_food': restaurant.get('type_food'),
                         'punctuation': restaurant.get('punctuation'),
                         'schedule': restaurant.get('schedule'),
                         'description': restaurant.get('description'),
                         'images': images})

        restaurants = {"restaurants": list}
        return Response(restaurants, status=status.HTTP_200_OK)
    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Lista de los restaurantes por precios más económicos


@api_view(['GET'])
def restaurants_list_prices(request):
    list = []
    if request.method == 'GET':
        restaurant = Restaurant.objects.filter(
            new=False).order_by('prices')[:10]
        restaurants_serializer = RestaurantInfoSerializer(
            restaurant, many=True)
        for restaurant in restaurants_serializer.data:
            images = imagen_list_10(restaurant.get('id_restaurant'))
            list.append({'id_restaurant': restaurant.get('id_restaurant'),
                         'name': restaurant.get('name'),
                         'menu': restaurant.get('menu'),
                         'address': restaurant.get('address'),
                         'prices': restaurant.get('prices'),
                         'type_food': restaurant.get('type_food'),
                         'punctuation': restaurant.get('punctuation'),
                         'schedule': restaurant.get('schedule'),
                         'description': restaurant.get('description'),
                         'images': images})

        restaurants = {"restaurants": list}
        return Response(restaurants, status=status.HTTP_200_OK)
    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)
# @api_view(['GET'])
# def tags_list(request):

#     if request.method == 'GET':
#         tags = TagsRestaurant.objects.all()
#         tags_serializer = TagsSerializer(tags, many=True)
#         return Response(tags_serializer.data, status=status.HTTP_200_OK)

#     else:
#         return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Lista de etiquetas de restaurante


@api_view(['GET'])
def tags_list_user(request, pk=None):

    if request.method == 'GET':
        tags = TagsRestaurant.objects.filter(restaurant=pk)
        tags_serializer = TagsListSerializer(tags, many=True)
        return Response(tags_serializer.data, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Eliminación de etiqueta de restaurante


@api_view(['DELETE'])
def tags_user_delete(request, pk=None):

    tags = TagsRestaurant.objects.filter(id_tags=pk)
    if tags:
        if request.method == 'DELETE':
            tags.delete()
            return Response({"code": 1}, status=status.HTTP_200_OK)
    return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)

# Eliminación de imagen


@api_view(['DELETE'])
def imagen_delete(request, pk=None):

    imagen = GalleryRestaurant.objects.filter(id_imagen=pk).first()
    print(pk)
    if imagen:
        if request.method == 'DELETE':
            imagen.delete()
            return Response({'message': 'La imagen fue eliminada correctamente!'}, status=status.HTTP_200_OK)

    return Response({'message': 'No se ha encontrado ninguna imagen con estos datos'}, status=status.HTTP_400_BAD_REQUEST)

# Búsqueda de restaurantes


@api_view(['GET'])
def restaurants_search(request, pk=None):
    if request.method == 'GET':
        restaurants = Restaurant.objects.filter(
            id_restaurant__in=pk, user__is_active=True)
        restaurants_serializer = RestaurantFieldSerializer(
            restaurants, many=True)
        return Response({'restaurants': restaurants_serializer.data}, status=status.HTTP_200_OK)
    else:
        return Response({'No se encontraron restaurantes'}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def search(request, pk=None):
    if request.method == 'GET':
        result = []
        list_extend = []
        restaurant_search = Restaurant.objects.filter(
            Q(user__name__icontains=pk)).all()
        tags = TagsRestaurant.objects.filter(Q(tags=pk)).all()

        if restaurant_search and len(tags) == 0:
            restaurant_serializer = SearchSerializerRestaurant(
                restaurant_search, many=True)
            for restaurant in list(unique_everseen(restaurant_serializer.data)):
                result.append({'restaurant_id': restaurant.get('restaurant_id'), 'name': restaurant.get('name'),
                               'address': restaurant.get('address'), 'prices': restaurant.get('prices'),
                               'type_food':  restaurant.get('type_food'), 'menu': restaurant.get('menu'),
                               'punctuation': restaurant.get('punctuation'), 'schedule': restaurant.get('schedule'),
                               'description': restaurant.get('description'), 'images': imagen_list(restaurant.get('restaurant_id'))})
            return Response({'search': result}, status=status.HTTP_200_OK)

        elif restaurant_search and tags:
            restaurant_serializer = SearchSerializerRestaurant(
                restaurant_search, many=True)
            tags_serializer = SearchSerializer(tags, many=True)
            for restaurants in restaurant_serializer.data:
                list_extend.append(restaurants)
            for tags in tags_serializer.data:
                list_extend.append(tags)
            for restaurant in list(unique_everseen(list_extend)):
                print(restaurant.get('restaurant_id'))
                result.append({'restaurant_id': restaurant.get('restaurant_id'), 'name': restaurant.get('name'),
                               'address': restaurant.get('address'), 'prices': restaurant.get('prices'),
                               'type_food':  restaurant.get('type_food'), 'menu': restaurant.get('menu'),
                               'punctuation': restaurant.get('punctuation'), 'schedule': restaurant.get('schedule'),
                               'description': restaurant.get('description'), 'images': imagen_list(restaurant.get('restaurant_id'))})
            return Response({'search': result}, status=status.HTTP_200_OK)

        elif tags and len(restaurant_search) == 0:
            tags_serializer = SearchSerializer(tags, many=True)
            for restaurant in list(unique_everseen(tags_serializer.data)):
                result.append({'restaurant_id': restaurant.get('restaurant_id'), 'name': restaurant.get('name'),
                               'address': restaurant.get('address'), 'prices': restaurant.get('prices'),
                               'type_food':  restaurant.get('type_food'), 'menu': restaurant.get('menu'),
                               'punctuation': restaurant.get('punctuation'), 'schedule': restaurant.get('schedule'),
                               'description': restaurant.get('description'), 'images': imagen_list(restaurant.get('restaurant_id'))})
            return Response({'search': result}, status=status.HTTP_200_OK)

        elif len(restaurant_search) == 0 and len(tags) == 0:
            return Response({'search': []}, status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)

# Recomendador


@api_view(['GET'])
def restaurant_recommender(request, pk):
    list = []
    if request.method == 'GET':
        commensal = Commensal.objects.filter(
            user=pk, user__is_active=True).first()
        if commensal is not None:
            if commensal.new is False:
                restaurants = Restaurant.objects.filter(id_restaurant__in=recommender(str(commensal.user_id), commensal.age, commensal.environment, commensal.interest, commensal.vegetarian), user__is_active=True)
                restaurants_serializer = RestaurantInfoSerializer(restaurants, many=True)
                for restaurant in restaurants_serializer.data:
                    images = imagen_list_10(restaurant.get('id_restaurant'))
                    list.append({'id_restaurant': restaurant.get('id_restaurant'),
                                'name': restaurant.get('name'),
                                'menu': restaurant.get('menu'),
                                'address': restaurant.get('address'),
                                'prices': restaurant.get('prices'),
                                'type_food': restaurant.get('type_food'),
                                'punctuation': restaurant.get('punctuation'),
                                'schedule': restaurant.get('schedule'),
                                'description': restaurant.get('description'),
                                'images': images})
                return Response({"restaurants": list}, status=status.HTTP_200_OK)
            else:
                restaurants = Restaurant.objects.filter(id_restaurant__in=recommender(str(commensal.user_id), "0", "", "", "0", user__is_active=True))
                restaurants_serializer = RestaurantInfoSerializer(restaurants, many=True)
                for restaurant in restaurants_serializer.data:
                    images = imagen_list_10(restaurant.get('id_restaurant'))
                    list.append({'id_restaurant': restaurant.get('id_restaurant'),
                                'name': restaurant.get('name'),
                                'menu': restaurant.get('menu'),
                                'address': restaurant.get('address'),
                                'prices': restaurant.get('prices'),
                                'type_food': restaurant.get('type_food'),
                                'punctuation': restaurant.get('punctuation'),
                                'schedule': restaurant.get('schedule'),
                                'description': restaurant.get('description'),
                                'images': images})
                return Response({"restaurants": list}, status=status.HTTP_200_OK)

        else:
            return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
