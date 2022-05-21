from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant
from restaurants.api.serializers import RestaurantSerializer


@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        restaurants = Restaurant.objects.all()
        restaurants_serializer = RestaurantSerializer(restaurants,many = True)
        return Response(restaurants_serializer.data,status = status.HTTP_200_OK)
    
    else:
        return Response({'Método \"GET\" no permitido.'},status = status.HTTP_400_BAD_REQUEST)
