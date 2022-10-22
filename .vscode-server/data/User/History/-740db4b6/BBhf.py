from django.db import models
from users.models import User, Commensal
from restaurants.models import Restaurant

# Create your models here.
class Score(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="restaurant",verbose_name='Restaurante',)
    id_user = models.ForeignKey(Commensal,on_delete=models.CASCADE,related_name="commensal",verbose_name='Comensal')
    punctuation = models.IntegerField('Puntuación',null = True, blank = True)

    class Meta:
        verbose_name = 'Calificación'
        verbose_name_plural = 'Calificaciones'

    
    def __str__(self):
            return f'id_user: {self.id_user__user}'

class Comments(models.Model):
    id_restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="restaurant_comments")
    id_user = models.ForeignKey(Commensal,on_delete=models.CASCADE,related_name="commensal_comments")
    comment = models.TextField('Sugerencias',null = True, blank = True)

    class Meta:
        verbose_name = 'Comentario'
        verbose_name_plural = 'Comentarios'