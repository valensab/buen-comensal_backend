# Generated by Django 4.0.4 on 2022-10-25 22:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('restaurants', '0009_alter_restaurant_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='id_restaurant',
            field=models.AutoField(primary_key=True, serialize=False, unique=True, verbose_name='ID Restaurante'),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='restaurant', to=settings.AUTH_USER_MODEL, verbose_name='ID Usuario'),
        ),
    ]
