# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-06-23 20:21
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('access', '0004_sendemail'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='SendEmail',
            new_name='SendDailyEmail',
        ),
    ]