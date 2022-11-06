from rest_framework import serializers
from users.models import User, Commensal
from django.utils import timezone

# Serializador de token
class UserTokenSerializer(serializers.ModelSerializer):

    email = serializers.EmailField()
    class Meta:
        model = User
        fields = ['email','password']

# Serializador de creación de user   
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
        updated_user.id = validated_data['id']
        updated_user.set_password(validated_data['password'])
        updated_user.save()
        return updated_user

# Serializador traer toda la info de restaurante
class UserAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        
class UserFieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'name', 'is_commensal', 'is_restaurant', 'email', 'last_name']

# Serializador de actualizar correo
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

# Serializador de actualizar nombre
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

# Serializador de comensal
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

# Serializador de comensal
class CommensalSerializer(serializers.ModelSerializer):
    name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField()
    phone_number= serializers.CharField(max_length=10)
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

# Serializador para actualizar información de comensal
class UpdateInfoCommensalSerializer(serializers.ModelSerializer):
    
    interest = serializers.CharField()
    environment = serializers.CharField()
    vegetarian = serializers.BooleanField()
    def update(self,instance,validated_data):
        updated_commensal = super().update(instance,validated_data)
        updated_commensal.vegetarian = validated_data['vegetarian']
        updated_commensal.environment = validated_data['environment']
        updated_commensal.interest = validated_data['interest']
        updated_commensal.new = False
        updated_commensal.save()
        return updated_commensal

    class Meta:
            model = Commensal
            fields = [ 'id_commensal', 'vegetarian', 'environment', 'interest']

# Serializadorcambio de contraseña
class ChangePasswordSerializer(serializers.ModelSerializer):
    def update(self,instance,validated_data):
        updated_user = super().update(instance,validated_data)
        updated_user.set_password(validated_data['password'])
        updated_user.save()
        return updated_user

    class Meta:
            model = User
            fields = [ 'id', 'password']
            
# Serializador ingreso manual de comensal
class CommensalSerializerManually(serializers.ModelSerializer):
    name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField()
    phone_number= serializers.CharField(max_length=10)
    age = serializers.IntegerField()
    interest = serializers.CharField()
    vegetarian = serializers.BooleanField()
    environment = serializers.CharField()
    def create(self, validated_data):
        user = User.objects.create(email = validated_data['email'], name = validated_data['name'], is_commensal = True, is_active = True, 
                                    last_login = timezone.now(), last_name = validated_data['last_name'])
        user.set_password(validated_data['password'])
        commensal = Commensal(user=user, phone_number = validated_data['phone_number'], age = validated_data['age'], new = False, vegetarian = validated_data['vegetarian'], interest =  validated_data['interest'], environment =validated_data['environment'] )
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
        fields = ['name', 'email', 'password', 'is_commensal','is_active','phone_number', 'last_name', 'age','vegetarian', 'interest','environment']
