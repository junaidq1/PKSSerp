# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-19 03:31
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0017_auto_20170218_2224'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studenthistory',
            name='date',
            field=models.DateField(default=datetime.date.today),
        ),
    ]
