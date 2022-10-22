from django.db import models
from users.models import User
from restaurants.models import Restaurant

# Create your models here.
class Score(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="restaurant")
    id_user = models.ForeignKey(User,on_delete=models.CASCADE,related_name="user")
    comment = models.TextField(blank = True, null = True)