# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-07-31 04:30
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0009_auto_20170329_1955'),
    ]

    operations = [
        migrations.AlterField(
            model_name='class',
            name='class_name',
            field=models.CharField(choices=[('Play Group', 'Play Group'), ('Nursery', 'Nursery'), ('Class 1', 'Class 1'), ('Class 2', 'Class 2'), ('Class 3', 'Class 3'), ('Class 4', 'Class 4'), ('Class 5', 'Class 5'), ('Class 6', 'Class 6')], max_length=255),
        ),
    ]