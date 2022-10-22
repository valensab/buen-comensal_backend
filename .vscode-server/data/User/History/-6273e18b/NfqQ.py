from rest_framework import serializers
from users.models import User, Commensal
from django.utils import timezone

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

class UserAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        
class UserFieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'name', 'is_commensal', 'is_restaurant', 'email', 'last_name']

class UserUpdateEmailSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()

    def validate_email(self, value):
        lower_email = value.lower()
        if User.objects.filter(email__iexact=lower_email).exists():
            raise serializers.ValidationError("Ya existe un usuario con este correo electrónico")
        return lower_email

    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.email = validated_data['email']
        updated_user.is_restaurant = True
        updated_user.is_active = True
        updated_user.save()
        return updated_user
    class Meta:
        model = User
        fields = ['id','is_active', 'is_restaurant', 'email']

class UserUpdateNameSerializer(serializers.ModelSerializer):
    
    name = serializers.CharField()
    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.name = validated_data['name']
        updated_user.is_restaurant = True
        updated_user.is_active = True
        updated_user.save()
        return updated_user
        
    class Meta:
        model = User
        fields = ['id','is_active', 'is_restaurant', 'name']

class UserCommensalSerializer(serializers.ModelSerializer):

    name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField()
    

    def create(self, validated_data):
        commensal = User(**validated_data)
        commensal.name = validated_data['name']
        commensal.last_name = validated_data['last_name']
        commensal.email = validated_data['email']
        commensal.is_commensal = True
        commensal.last_login = timezone.now()
        commensal.set_password(validated_data['password'])
        commensal.save()
        return commensal

    def validate_email(self, value):
        lower_email = value.lower()
        if User.objects.filter(email__iexact=lower_email).exists():
            raise serializers.ValidationError("Ya existe un usuario con este correo electrónico")
        return lower_email

    class Meta:
        model = User
        fields = ['id', 'email','name','last_name']

class CommensalSerializer(serializers.ModelSerializer):
    name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField()
    phone_number= serializers.CharField()
    age = serializers.IntegerField()
    def create(self, validated_data):
        user = User.objects.create(email = validated_data['email'], name = validated_data['name'], is_commensal = True, is_active = True, 
                                    last_login = timezone.now(), last_name = validated_data['last_name'])
        user.set_password(validated_data['password'])
        commensal = Commensal(user=user, phone_number = validated_data['phone_number'], age = validated_data['age'], new = True)
        commensal.save()
        user.save()
        return validated_data

    def validate_email(self, value):
        lower_email = value.lower()
        if User.objects.filter(email__iexact=lower_email).exists():
            raise serializers.ValidationError("Ya existe un usuario con este correo electrónico")
        return lower_email

    class Meta:
        model = User
        fields = ['name', 'email', 'password', 'is_commensal','is_active','phone_number', 'last_name', 'age']

class UpdateInfoCommensalSerializer(serializers.ModelSerializer):
    
    interest = serializers.CharField()
    environment = serializers.CharField()
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
