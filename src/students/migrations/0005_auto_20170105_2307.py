# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-01-06 04:07
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0004_student_reason_left'),
    ]

    operations = [
        migrations.RenameField(
            model_name='student',
            old_name='is_active',
            new_name='currently_enrolled',
        ),
    ]