# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-03-07 17:09
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0010_auto_20170731_0030'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='class',
            options={'ordering': ['school_class_section']},
        ),
    ]