# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-05-14 14:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schools', '0004_schoolshift'),
        ('teachers', '0007_auto_20170730_1417'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='pkss_school_shift',
            field=models.ManyToManyField(blank=True, to='schools.SchoolShift'),
        ),
    ]