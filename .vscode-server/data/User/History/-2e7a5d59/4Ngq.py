from rest_framework import serializers
from users.models import User
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant
from django.utils import timezone
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from users.api.serializers import UserAllSerializer
from taggit.serializers import (TagListSerializerField, TaggitSerializer)
from taggit.managers import TaggableManager

class RestaurantFieldSerializer(serializers.ModelSerializer):

    user = UserAllSerializer()

    class Meta:
        model = Restaurant
        fields = ['user']
    
    def to_representation(self, instance):
        return{
                
                    'id_restaurant': instance.id_restaurant,
                    'address': instance.address,
                    'name': instance.user.name,
                    'email': instance.user.email,
                    'menu': instance.menu.url if instance.menu != '' else ''
                }

class RestaurantSerializer(serializers.ModelSerializer):
    name = serializers.CharField()
    name_representative = serializers.CharField()
    last_name_representative = serializers.CharField()
    phone_number= serializers.CharField()
    phone_number_representative = serializers.CharField()
    address = serializers.CharField()
    neighborhood = serializers.CharField()
    description = serializers.CharField()
    menu = serializers.FileField()
    prices = serializers.DecimalField(max_digits=10, decimal_places=3)
    email = serializers.EmailField()

    def create(self, validated_data):
        user = User.objects.create(email = validated_data['email'], name = validated_data['name'], is_restaurant = True, is_active = True, 
                                    last_login = timezone.now(), last_name = "")
        user.set_password(validated_data['password'])
        
        restaurant = Restaurant(user=user, name_representative = validated_data['name_representative'],
                                            last_name_representative = validated_data['last_name_representative'],
                                            phone_number = validated_data['phone_number'],
                                            phone_number_representative = validated_data['phone_number_representative'],
                                            address = validated_data['address'],
                                            neighborhood = validated_data['neighborhood'],
                                            description = validated_data['description'],
                                            prices = validated_data['prices'],
                                            menu = validated_data['menu'])
        restaurant.save()
        user.save()
        return validated_data
    
    def validate_email(self, value):
        lower_email = value.lower()
        if User.objects.filter(email__iexact=lower_email).exists():
            raise serializers.ValidationError("Ya existe un usuario con este correo electrónico")
        return lower_email

    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.set_password(validated_data['password'])
        updated_user.save()
        return updated_user

    class Meta:
        model = User
        fields = ['name', 'email', 'password', 'is_restaurant','is_active','name_representative','last_name_representative','phone_number',
                 'phone_number_representative', 'address', 'neighborhood','description','prices','menu']

class UpdateContactSerializer(serializers.ModelSerializer):
    
    name_representative = serializers.CharField()
    last_name_representative = serializers.CharField()
    phone_number_representative = serializers.CharField()
    # user = UserFieldSerializer(read_only=True)

    def update(self,instance,validated_data):
        #user = User.objects.update(email = validated_data['email'], name = validated_data['name'], is_restaurant = True, is_active = True)
        updated_restaurant = super().update(instance,validated_data)
        updated_restaurant.name_representative = validated_data['name_representative']
        updated_restaurant.last_name_representative = validated_data['last_name_representative']
        updated_restaurant.phone_number_representative = validated_data['phone_number_representative']
        updated_restaurant.save()
        return updated_restaurant

    class Meta:
            model = Restaurant
            fields = ['name_representative','last_name_representative','phone_number_representative']

class UpdateRestaurantSerializer(serializers.ModelSerializer):
    
    phone_number= serializers.CharField()
    address = serializers.CharField()
    neighborhood = serializers.CharField()
    prices = serializers.DecimalField(max_digits=10, decimal_places=3)

    def update(self,instance,validated_data):
        #user = User.objects.update(email = validated_data['email'], name = validated_data['name'], is_restaurant = True, is_active = True)
        updated_restaurant = super().update(instance,validated_data)
        updated_restaurant.phone_number = validated_data['phone_number']
        updated_restaurant.address = validated_data['address']
        updated_restaurant.neighborhood = validated_data['neighborhood']
        updated_restaurant.prices = validated_data['prices']
        updated_restaurant.save()
        return updated_restaurant

    class Meta:
            model = Restaurant
            fields = ['phone_number', 'address', 'neighborhood','prices']

class UpdateInfoRestaurantSerializer(serializers.ModelSerializer):
    
    type_food = serializers.CharField()
    schedule = serializers.TimeField()
    def update(self,instance,validated_data):
        #user = User.objects.update(email = validated_data['email'], name = validated_data['name'], is_restaurant = True, is_active = True)
        updated_restaurant = super().update(instance,validated_data)
        updated_restaurant.active = True
        updated_restaurant.type_food = validated_data['type_food']
        updated_restaurant.schedule = validated_data['schedule']
        updated_restaurant.save()

        return updated_restaurant

    class Meta:
            model = Restaurant
            fields = [ 'schedule', 'type_food', 'active']

class UpdateMenuRestaurantSerializer(serializers.ModelSerializer):
    
    menu = serializers.FileField()

    def update(self,instance,validated_data):
        updated_restaurant = super().update(instance,validated_data)
        updated_restaurant.menu = validated_data['menu']
        return updated_restaurant

    class Meta:
            model = Restaurant
            fields = ['menu']


class UpdateDescriptionRestaurantSerializer(serializers.ModelSerializer):
    
    description = serializers.CharField()

    def update(self,instance,validated_data):
        updated_restaurant = super().update(instance,validated_data)
        updated_restaurant.menu = validated_data['description']
        return updated_restaurant

    class Meta:
            model = Restaurant
            fields = ['description']
            
class ImagenRestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = GalleryRestaurant
        fields = "__all__"

        def create(self, validated_data):
            imagen = GalleryRestaurant(**validated_data)    
            imagen.restaurant = validated_data['restaurant']
            imagen.imagen = validated_data.list['imagen']
            imagen.save()
            return validated_data

class ImagenListSerializer(serializers.ModelSerializer):
    class Meta:
        model = GalleryRestaurant
        fields = ['imagen']

class TagsListSerializer(serializers.ModelSerializer):
    class Meta:
        model = TagsRestaurant
        fields = ['restaurant']


# class TagsSerializer(TaggitSerializer, serializers.ModelSerializer):

#     class Meta:
#         model = TagsRestaurant
#         fields = "__all__"

class TagsSerializer(serializers.ModelSerializer):
    tags = serializers.CharField()
    class Meta:
        model = TagsRestaurant
        fields = ['restaurant', 'tags', 'id_tags']

class TagsSerializer(serializers.ModelSerializer):
    tags = serializers.CharField()
    class Meta:
        model = TagsRestaurant
        fields = ['tags']


# class TagsListSerializer(TaggitSerializer, serializers.ModelSerializer):
#     tags = TagListSerializerField()

#     class Meta:
#         model = TagsRestaurant
#         fields = "__all__"

# class SearchTagsSerializer(TaggitSerializer, serializers.ModelSerializer):
#     tags = TagListSerializerField()
#     restaurant = RestaurantFieldSerializer
#     class Meta:
#         model = TagsRestaurant
#         fields = ['restaurant', 'tags']

#     def to_representation(self, instance):
#         return{
                
#                     'restaurant_id': instance.restaurant.id_restaurant,
#                     'address': instance.restaurant.address,
#                     'name': instance.restaurant.user.name

#                 }

class SearchTagsSerializer(serializers.ModelSerializer):
    tags = serializers.CharField()
    restaurant = RestaurantFieldSerializer
    class Meta:
        model = TagsRestaurant
        fields = ['restaurant', 'tags']

    def to_representation(self, instance):
        return{
                
                    'restaurant_id': instance.restaurant.id_restaurant,
                    'address': instance.restaurant.address,
                    'name': instance.restaurant.user.name

                }