from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from restaurants.models import Restaurant
from restaurants.api.serializers import RestaurantSerializer


@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        restaurant = Restaurant.objects.all()
        users_serializer = RestaurantSerializer(users,many = True)
        return Response(users_serializer.data,status = status.HTTP_200_OK)
    
    else:
        return Response({'Método \"GET\" no permitido.'},status = status.HTTP_400_BAD_REQUEST)
