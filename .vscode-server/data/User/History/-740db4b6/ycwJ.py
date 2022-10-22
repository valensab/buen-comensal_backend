from django.db import models
from users.models import User, Commensal
from restaurants.models import Restaurant

# Create your models here.
class Score(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="restaurant")
    id_user = models.ForeignKey(Commensal,on_delete=models.CASCADE,related_name="user")
    punctuation = models.IntegerField('Puntuación',null = True, blank = True)


class Comments(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="restaurant_comments")
    id_user = models.ForeignKey(Commensal,on_delete=models.CASCADE,related_name="user_comments")
    comment = models.TextField('Sugerencias',null = True, blank = True)