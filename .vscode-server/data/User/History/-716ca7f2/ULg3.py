from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant, GalleryRestaurant
from restaurants.api.serializers import RestaurantFieldSerializer, ImagenListSerializer


@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        users = Restaurant.objects.all()
        users_serializer = RestaurantFieldSerializer(users,many = True)
        return Response(users_serializer.data,status = status.HTTP_200_OK)
    
    else:
        return Response({'Método \"GET\" no permitido.'},status = status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def imagen_list(request, pk = None):
    if request.method == 'GET':
        images = GalleryRestaurant.objects.filter(restaurant = pk)
        imagen_count = GalleryRestaurant.objects.filter(restaurant = pk).count()
        imagen_serializer = ImagenListSerializer(images,many = True)
        if imagen_count == 0:
            return Response({'message': 'No hay imágenes en este restaurante '},status = status.HTTP_200_OK)
        else:
            data = {
                'Número de imágenes': imagen_count,
                "Imágenes": imagen_serializer.data,
            }
            return Response(data,status = status.HTTP_200_OK)
    else:
        return Response({'Solo se soporta método GET'},status = status.HTTP_400_BAD_REQUEST)