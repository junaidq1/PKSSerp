# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-05-19 16:22
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('schools', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SchoolShift',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('shift', models.CharField(choices=[('morning', 'morning'), ('evening', 'evening')], max_length=32)),
                ('school', models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='schools.School')),
            ],
        ),
    ]
