@api_view(['GET'])
def restaurant_list(request):

    if request.method == 'GET':
        users = User.objects.filter(is_active = True)
        users_serializer = UserSerializer(users,many = True)
        return Response(users_serializer.data,status = status.HTTP_200_OK)
    
    else:
        return Response({'Método \"GET\" no permitido.'},status = status.HTTP_400_BAD_REQUEST)
