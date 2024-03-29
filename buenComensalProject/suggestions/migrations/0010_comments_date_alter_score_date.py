# Generated by Django 4.0.4 on 2022-10-25 22:22

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('suggestions', '0009_score_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='comments',
            name='date',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now, verbose_name='Fecha'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='score',
            name='date',
            field=models.DateField(auto_now_add=True, verbose_name='Fecha'),
        ),
    ]
