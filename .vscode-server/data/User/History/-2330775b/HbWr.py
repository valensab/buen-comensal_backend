from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import ListAPIView
from rest_framework import filters
from rest_framework import generics
from users.models import User
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from django.contrib.auth import authenticate
from users.api.serializers import UserTokenSerializer, UserFieldSerializer, UserUpdateEmailSerializer, UserUpdateNameSerializer
from users.api.serializers import UserFieldSerializer
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant
from restaurants.api.serializers import RestaurantSerializer,  RestaurantFieldSerializer, ImagenRestaurantSerializer, ImagenListSerializer, UpdateContactSerializer, UpdateRestaurantSerializer, UpdateMenuRestaurantSerializer, UpdateInfoSerializer, UpdateDescriptionRestaurantSerializer, TagsSerializer, SearchTagsSerializer, UpdateInfoRestaurantSerializer, TagsListSerializer



# Create your views here.
class RegisterRestaurant(APIView):

    def post(self, request,*args,**kwargs):
        serializer = RestaurantSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"code":1}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors(), status=status.HTTP_400_BAD_REQUEST)   

class LoginRestaurant(ObtainAuthToken):
    serializer_class = UserTokenSerializer
    def post(self,request,*args,**kwargs):
        # send to serializer username and password
        login_serializer = self.serializer_class(data = request.data, context = {'request':request})
        if login_serializer.is_valid():
            # login serializer return user in validated_data
            email = login_serializer.data['email'].lower()
            password = login_serializer.data['password']
            user = authenticate(username=email, password=password)
            #print(user)
            if user is not None and user.is_active and user.is_restaurant:
                token,created = Token.objects.get_or_create(user = user)
                user_serializer = UserFieldSerializer(user)
                restaurant = Restaurant.objects.filter(user_id = user_serializer.data['id']).first()
                tags = TagsRestaurant.objects.filter(restaurant= restaurant.id_restaurant)
                tags_serializers = TagsListSerializer(tags, many=True)
                if created:
                    return Response({
                        'token': token.key,
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'id_restaurant': restaurant.id_restaurant,
                        'menu': restaurant.menu.url if restaurant.menu != '' else '',
                        'name_representative': restaurant.name_representative,
                        'last_name_representative': restaurant.last_name_representative,
                        'phone_number': restaurant.phone_number,
                        'phone_number_representative': restaurant.phone_number_representative,
                        'address': restaurant.address,
                        'neighborhood': restaurant.neighborhood,
                        'description': restaurant.description,
                        'prices': restaurant.prices,
                        'schedule': restaurant.schedule,
                        'active': restaurant.active,
                        'type_food': restaurant.type_food,
                        'vegetarian': restaurant.vegetarian,
                        'new': restaurant.new,
                        'environment': restaurant.environment,
                        'tags': tags_serializers.data,
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                else:
                    token.delete()
                    token = Token.objects.create(user = user)
                    return Response({
                        'token': token.key,
                        'email': user_serializer.data['email'],
                        'name': user_serializer.data['name'],
                        'id_restaurant': restaurant.id_restaurant,
                        'menu': restaurant.menu.url if restaurant.menu != '' else '',
                        'name_representative': restaurant.name_representative,
                        'last_name_representative': restaurant.last_name_representative,
                        'phone_number': restaurant.phone_number,
                        'phone_number_representative': restaurant.phone_number_representative,
                        'address': restaurant.address,
                        'neighborhood': restaurant.neighborhood,
                        'description': restaurant.description,
                        'prices': restaurant.prices,
                        'schedule': restaurant.schedule,
                        'active': restaurant.active,
                        'type_food': restaurant.type_food,
                        'vegetarian': restaurant.vegetarian,
                        'new': restaurant.new,
                        'environment': restaurant.environment,
                        'tags': tags_serializers.data,
                        'message': 'Inicio de sesión exitoso.'
                    }, status = status.HTTP_201_CREATED)
                  
            else:
                return Response({'error': 'Nombre de usuario o contraseña incorrectos.'},
                                    status = status.HTTP_400_BAD_REQUEST)
                
        else:
            return Response({'error':'Este usuario no puede iniciar sesión.'}, 
                                    status = status.HTTP_401_UNAUTHORIZED)

class Logout(APIView):
    
    def get(self,request,*args,**kwargs):
        try:
            token = request.GET.get('token')
            token = Token.objects.filter(key = token).first()

            if token:
                user = token.user
                token.delete() 
                token_message = 'Token eliminado.'
                return Response({'token_message': token_message,}, status = status.HTTP_200_OK)
            
            return Response({'error':'No se ha encontrado un usuario con estas credenciales.'},
                    status = status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'error': 'No se ha encontrado token en la petición.'}, 
                                    status = status.HTTP_409_CONFLICT)
        
        
class UserToken(APIView):

    def post(self,request, *args,**kwargs):    
        try:      
            user_id = request.data['user_id']
            token = request.data['token']
            print(user_id)
            token = Token.objects.filter(user_id = user_id).first()
            print(token)
            if token:
                return Response({'is_validate': 1}, status = status.HTTP_200_OK)
            else:
                return Response({'is_validate': 2}, status = status.HTTP_200_OK)
        except:
            return Response({'Peticion inválida'}, status = status.HTTP_400_BAD_REQUEST)

class UpdateContanctAPIView(APIView):      
    def put(self, request, pk, format=None):
        restaurant = Restaurant.objects.filter(id_restaurant = pk).first()
        user = User.objects.filter(id = restaurant.user_id).first()
        serializer_restaurant = UpdateContactSerializer(restaurant, data=request.data)
        print(request.data['email'])
        serializer_user = UserUpdateEmailSerializer(user, data=request.data)
        email_actual = user.email
        email_nuevo = request.data['email']

        if (email_nuevo == email_actual):

            if serializer_restaurant.is_valid(): 
                serializer_restaurant.save()
                    
                return Response({"code": 1}, status=status.HTTP_201_CREATED)
            else: 
                return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            if serializer_user.is_valid():
                if serializer_restaurant.is_valid(): 
                    serializer_restaurant.save()
                    serializer_user.save()
                    return Response({"code": 1}, status=status.HTTP_201_CREATED)
                else: 
                    return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"code": 2}, status=status.HTTP_400_BAD_REQUEST)

class RestaurantUpdateAPIView(APIView):      
    def put(self, request, pk, format=None):
        restaurant = Restaurant.objects.filter(id_restaurant = pk).first()
        user = User.objects.filter(id = restaurant.user_id).first()
        serializer_restaurant = UpdateRestaurantSerializer(restaurant, data=request.data)
        serializer_user = UserUpdateNameSerializer(user, data=request.data)
        if serializer_user.is_valid():
            if serializer_restaurant.is_valid(): 
                serializer_restaurant.save()
                serializer_user.save()
                return Response({"code": 1}, status=status.HTTP_201_CREATED)
            else: 
                return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializer_user.errors, status=status.HTTP_400_BAD_REQUEST)

class RestaurantUpdateMenuAPIView(APIView):      
    def put(self, request, pk, format=None):
        restaurant = Restaurant.objects.filter(id_restaurant = pk).first()        
        serializer_restaurant = UpdateMenuRestaurantSerializer(restaurant, data=request.data)
        if serializer_restaurant.is_valid():
            serializer_restaurant.save()
            return Response({"code": 1}, status=status.HTTP_201_CREATED)
        return Response({"code":2}, status=status.HTTP_400_BAD_REQUEST)

class RestaurantUpdateDescriptionAPIView(APIView):      
    def put(self, request, pk, format=None):
        restaurant = Restaurant.objects.filter(id_restaurant = pk).first()        
        serializer_restaurant = UpdateDescriptionRestaurantSerializer(restaurant, data=request.data)
        if serializer_restaurant.is_valid():
            serializer_restaurant.save()
            return Response({"code": 1}, status=status.HTTP_201_CREATED)
        return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)

class RestaurantUpdateInfoAPIView(APIView):      
    def put(self, request, pk, format=None):
        restaurant = Restaurant.objects.filter(id_restaurant = pk).first()        
        serializer_restaurant = UpdateInfoRestaurantSerializer(restaurant, data=request.data)
        if serializer_restaurant.is_valid():
            serializer_restaurant.save()
            print(serializer_restaurant)
            return Response({"code": 1}, status=status.HTTP_201_CREATED)
        return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)

class RestaurantUpdateInfoAllAPIView(APIView):      
    def put(self, request):
        id_restaurant = request.data['restaurant']
        restaurant = Restaurant.objects.filter(id_restaurant = id_restaurant).first()  
        if restaurant:      
            serializer_restaurant = UpdateInfoSerializer(restaurant, data=request.data)
            if serializer_restaurant.is_valid():
                serializer = ImagenRestaurantSerializer(data= request.data)
                if serializer.is_valid():
                    print(request.FILES.getlist('imagen'))
                    for image in request.FILES.getlist('imagen'):
                        print(image)
                        GalleryRestaurant.objects.create(imagen = image, restaurant_id = id_restaurant)
                    serializer_restaurant.save()
                    return Response({"code": 1}, status=status.HTTP_201_CREATED)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            return Response(serializer_restaurant.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response({"code": 3}, status=status.HTTP_400_BAD_REQUEST)

class ImagenRestaurant(APIView):

    def post(self, request,*args,**kwargs):
            serializer = ImagenRestaurantSerializer(data= request.data)
            restaurant = request.data['restaurant']
            if serializer.is_valid():
                print(request.FILES.getlist('imagen'))
                for image in request.FILES.getlist('imagen'):
                    print(image)
                    GalleryRestaurant.objects.create(imagen = image, restaurant_id = restaurant)
                    
                return Response({"code": 1}, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   

# class TagsRestaurantAPIView(APIView):

#     def post(self, request,*args,**kwargs):
#         serializer = TagsSerializer(data= request.data)
#         restaurant = request.data['restaurant']
#         if serializer.is_valid():
#             serializer.save()
#             return Response({"message": "Etiquetas agregadas con éxito"}, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   
class TagsRestaurantAPIView(APIView):

    def post(self, request,*args,**kwargs):
        serializer = TagsSerializer(data= request.data)
        
        if serializer.is_valid():
            tags = TagsRestaurant.objects.filter(tags = request.data['tags'].lower(), restaurant= request.data['restaurant']).first()
            if tags:
                return Response({"code": 2},status=status.HTTP_400_BAD_REQUEST)
            else: 
                serializer.save()
                return Response({"code": 1}, status=status.HTTP_201_CREATED)
                
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   

# class TagsListAPIView(ListAPIView):
#     tags = TagsRestaurant.objects.all()
#     serializer_class = TagsListSerializer

# class TagsFilterListAPIView(generics.ListAPIView):
#     queryset = TagsRestaurant.objects.all()
#     serializer_class = SearchTagsSerializer
#     filter_backends = [filters.SearchFilter]
#     search_fields = ['tags__name']

class TagsFilterListAPIView(generics.ListAPIView):
    queryset = TagsRestaurant.objects.all()
    serializer_class = SearchTagsSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['tags']