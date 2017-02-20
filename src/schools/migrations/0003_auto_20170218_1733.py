# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-18 22:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schools', '0002_school_shift'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='school',
            name='shift',
        ),
        migrations.AddField(
            model_name='school',
            name='school_notes',
            field=models.TextField(blank=True, max_length=2500, null=True),
        ),
    ]