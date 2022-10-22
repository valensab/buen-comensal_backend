from django.shortcuts import render
from suggestions.api.serializers import ScoreSerializer
from users.models import Commensal
# Create your views here.
class ScoreRegister(APIView):

    def post(self, request,*args,**kwargs):
        serializer = ScoreSerializer(data= request.data)
        id_user = request.data['user']
        id_user = Commensal.objects.filter(id_commensal = id_user).first()
        print(id_user)
        if serializer.is_valid():
            #serializer.save()
            return Response({"code":1}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   