from django.shortcuts import render
from suggestions.api.serializers import ScoreAllSerializer
# Create your views here.
class Score(APIView):

    def post(self, request,*args,**kwargs):
        serializer = RestaurantSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"code":1}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   