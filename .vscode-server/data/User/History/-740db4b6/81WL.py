from django.db import models
from users.models import User, Commensal
from restaurants.models import Restaurant

# Create your models here.
class Score(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,verbose_name= u'Restaurante', on_delete=models.CASCADE,related_name="'suggestions.Score.id_restaurant")
    id_user = models.ForeignKey(User,verbose_name=u'Comensal',on_delete=models.CASCADE,related_name="'suggestions.Score.id_user'")
    punctuation = models.IntegerField('Puntuación',null = True, blank = True)
    comment = models.TextField('Comentarios',null = True, blank = True)
    class Meta:
        verbose_name = 'Calificación'
        verbose_name_plural = 'Calificaciones'



class Comments(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="'suggestions.Comments.id_restaurant", verbose_name='Restaurante')
    id_user = models.ForeignKey(User,on_delete=models.CASCADE,related_name="'suggestions.Comments.id_user'", verbose_name='Comensal')
    comment = models.TextField('Sugerencias',null = False, blank = False)

    class Meta:
        verbose_name = 'Comentario'
        verbose_name_plural = 'Comentarios'