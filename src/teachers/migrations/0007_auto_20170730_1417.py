# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-07-30 18:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teachers', '0006_auto_20170301_1656'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teacher',
            name='level',
            field=models.CharField(choices=[('principal', 'principal'), ('vice principal', 'vice principal'), ('teacher', 'teacher'), ('teacher aid', 'teacher aid')], max_length=255),
        ),
    ]