from rest_framework import serializers
from users.models import User
from django.utils import timezone
from rest_framework.authtoken.models import Token

class UserTokenSerializer(serializers.ModelSerializer):

    email = serializers.EmailField()
    class Meta:
        model = User
        fields = ['email','password']
    
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        
    def create(self,validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user
    
    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.set_password(validated_data['password'])
        updated_user.save()
        return updated_user


class UserFieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email','name', 'last_name','is_commensal','is_restaurant', 'id']

class RestaurantSerializer(serializers.ModelSerializer):

    name = serializers.CharField()
    email = serializers.EmailField()
    phone_number = serializers.CharField()
    address = serializers.CharField()
    neighborhood = models.CharField()
    description = models.CharField()
    menu = models.CharField()
    princes = models.CharField()

    def create(self, validated_data):
        restaurant = User(**validated_data)
        restaurant.name = validated_data['name']
        restaurant.email = validated_data['email']
        restaurant.phone_number = validated_data['phone_number']
        restaurant.address = validated_data['address']
        restaurant.neighborhood = validated_data['neighborhood']
        restaurant.is_restaurant = True
        restaurant.last_login = timezone.now()
        restaurant.set_password(validated_data['password'])
        restaurant.save()
        return restaurant


    def validate_email(self, value):
        lower_email = value.lower()
        if User.objects.filter(email__iexact=lower_email).exists():
            raise serializers.ValidationError("Ya existe un sitio con este correo electrónico")
        return lower_email

    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.set_password(validated_data['password'])
        updated_user.save()
        return updated_user

    class Meta:
        model = User
        fields = "__all__"