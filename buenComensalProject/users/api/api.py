from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from users.models import User
from users.api.serializers import UserSerializer
from django.contrib.auth.hashers import make_password, check_password

# Lista de usuarios
@api_view(['GET'])
def user_list(request):

    if request.method == 'GET':
        users = User.objects.filter(is_active=True)
        users_serializer = UserSerializer(users, many=True)
        return Response(users_serializer.data, status=status.HTTP_200_OK)

    else:
        return Response({'Método \"GET\" no permitido.'}, status=status.HTTP_400_BAD_REQUEST)

# Eliminar usuario
@api_view(['DELETE'])
def user_delete(request, pk=None):
    # queryset
    print(pk)
    user = User.objects.filter(id=pk).first()

    # validation
    if user:
        if request.method == 'DELETE':
            user.is_active = False
            user.save()
            return Response({'message': 'Usuario eliminado correctamente!'}, status=status.HTTP_200_OK)

    return Response({'message': 'No se ha encontrado un usuario con estos datos'}, status=status.HTTP_400_BAD_REQUEST)

# Contar usuarios
@api_view(['GET'])
def user_count(request):

    if request.method == 'GET':
        users_count = User.objects.filter(is_active=True).count()
        data = {
            "count": users_count
        }
        return Response(data, status=status.HTTP_200_OK)

    else:
        return Response({'Solo se soporta metodo GET'}, status=status.HTTP_400_BAD_REQUEST)

# Cambiar contraseña
@api_view(['PUT'])
def user_change_password(request):

    if request.method == 'PUT':

        user = User.objects.filter(id=request.data["id_user"]).first()
        if user:
            if check_password(request.data["password"], user.password):
                # return Response({'message': "Ingrese una contraseña distinta a la actual"}, status=status.HTTP_400_BAD_REQUEST)
                return Response({'code': 2}, status=status.HTTP_400_BAD_REQUEST)
            else:
                User.set_password(self=user, raw_password=request.data["password"])
                user.save()
                # return Response({'message': "La contraseña se ha cambiado"}, status=status.HTTP_201_CREATED)
                return Response({'code': 1}, status=status.HTTP_200_OK)
        else:
            return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response({'code': 3}, status=status.HTTP_400_BAD_REQUEST)
