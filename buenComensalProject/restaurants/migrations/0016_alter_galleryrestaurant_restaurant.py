# Generated by Django 4.0.4 on 2022-10-26 09:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0015_alter_galleryrestaurant_restaurant'),
    ]

    operations = [
        migrations.AlterField(
            model_name='galleryrestaurant',
            name='restaurant',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='restaurants.restaurant', verbose_name='ID Restaurante'),
        ),
    ]
