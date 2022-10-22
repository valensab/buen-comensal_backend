from rest_framework import serializers
from users.models import Commensal
from django.utils import timezone
from restaurants.models import Restaurant
from suggestions.models import Score, Comments

class ScoreAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = Score
        fields = '__all__'

class CommentsAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comments
        fields = '__all__'