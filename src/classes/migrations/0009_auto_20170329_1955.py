# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-29 23:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0008_remove_class_teacher'),
    ]

    operations = [
        migrations.AddField(
            model_name='class',
            name='currently_active',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='class',
            name='notes',
            field=models.TextField(blank=True, max_length=2500, null=True),
        ),
    ]
