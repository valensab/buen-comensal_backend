from rest_framework import serializers
from users.models import Commensal
from django.utils import timezone
from restaurants.models import Restaurant
from suggestions.models import Score, Comments


class ScoreSerializer(serializers.ModelSerializer):
    punctuation = serializers.IntegerField()
    def create(self, validated_data):
        score = Score(**validated_data)
        score.id_restaurant = validated_data['id_restaurant']
        score.id_user = validated_data.list['id_user']
        score.punctuation = validated_data['punctuation']
        score.save()
        return validated_data

    class Meta:
        model = Score
        fields = '__all__'


class CommentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comments
        fields = '__all__'
