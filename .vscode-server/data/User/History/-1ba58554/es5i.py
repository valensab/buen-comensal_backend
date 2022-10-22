from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import ListAPIView
from rest_framework import filters
from rest_framework import generics
from django.shortcuts import render
from suggestions.api.serializers import ScoreSerializer
from users.models import Commensal
# Create your views here.
class ScoreRegister(APIView):

    def post(self, request,*args,**kwargs):
        serializer = ScoreSerializer(data= request.data)
        id_user = request.data['id_user']
        id_user = Commensal.objects.filter(id_commensal = id_user, user__is_comensal = True).first()
        print(id_user)
        if id_user != 'None':
            if serializer.is_valid():
                #serializer.save()
                return Response({"code":1}, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   