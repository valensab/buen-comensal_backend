from rest_framework import serializers
from users.models import Commensal
from django.utils import timezone
from users.models import User, Commensal
from users.api.serializers import UserAllSerializer
from restaurants.api.serializers import RestaurantInfoSerializer
from restaurants.models import Restaurant
from suggestions.models import Score, Comments, Favorites


class ScoreSerializer(serializers.ModelSerializer):
    punctuation = serializers.IntegerField()

    def create(self, validated_data):
        score = Score(**validated_data)
        score.id_restaurant = validated_data['id_restaurant']
        score.id_user = validated_data['id_user']
        score.punctuation = validated_data['punctuation']
        score.comment = validated_data['comment']
        score.save()
        return validated_data

    class Meta:
        model = Score
        fields = ['id_user', 'id_restaurant', 'punctuation', 'comment']


class CommentsSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        score = Comments(**validated_data)
        score.id_restaurant = validated_data['id_restaurant']
        score.id_user = validated_data['id_user']
        score.comment = validated_data['comment']
        score.save()
        return validated_data

    class Meta:
        model = Comments
        fields = '__all__'

class FavoriteSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        favorite = Favorites(**validated_data)
        favorite.id_restaurant = validated_data['id_restaurant']
        favorite.id_user = validated_data['id_user']
        favorite.favorite = True
        favorite.save()
        return validated_data

    class Meta:
        model = Favorites
        fields = ['id_user', 'id_restaurant', 'favorite']

class ScoreAllSerializer(serializers.ModelSerializer):
    user = UserAllSerializer()
    class Meta:
        model = Score
        fields = ['id_user']

    def to_representation(self, instance):
        return{
                    'commensal': instance.id_user.name,
                    'last_name': instance.id_user.last_name,
                    'punctuation': instance.punctuation,
                    'comment': instance.comment,
                    'date' : instance.date
                }

class CommentsAllSerializer(serializers.ModelSerializer):
    id_restaurant = RestaurantInfoSerializer()
    class Meta:
        model = Score
        fields = ['id_restaurant']

    def to_representation(self, instance):
        return{
                    'id_restaurant': instance.id_restaurant.id_restaurant,
                    'name': instance.id_restaurant.user.name,
                    'punctuation': instance.id_restaurant.punctuation,
                    'comment': instance.comment,
                    'date' : instance.date
                }

