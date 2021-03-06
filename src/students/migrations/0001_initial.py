# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-05-08 18:11
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('classes', '0001_initial'),
        ('schools', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('registration_number', models.IntegerField()),
                ('first_name', models.CharField(max_length=255)),
                ('last_name', models.CharField(max_length=255)),
                ('gender', models.CharField(choices=[('male', 'male'), ('female', 'female')], max_length=12)),
                ('date_of_birth', models.DateField(default=datetime.date.today)),
                ('place_of_birth', models.CharField(blank=True, max_length=255, null=True)),
                ('fathers_name', models.CharField(blank=True, max_length=255, null=True)),
                ('fathers_occupation', models.CharField(blank=True, max_length=255, null=True)),
                ('mothers_name', models.CharField(blank=True, max_length=255, null=True)),
                ('mothers_occupation', models.CharField(blank=True, max_length=255, null=True)),
                ('address_current', models.CharField(blank=True, max_length=255, null=True)),
                ('address_origin', models.CharField(blank=True, max_length=255, null=True)),
                ('contact_number', models.CharField(blank=True, max_length=255, null=True)),
                ('emergency_contact_number', models.CharField(blank=True, max_length=255, null=True)),
                ('date_joined', models.DateField(default=datetime.date.today)),
                ('pkss_class_original', models.CharField(default='aa', max_length=255)),
                ('enrollment_notes', models.TextField(blank=True, max_length=2500, null=True)),
                ('fee_percent_rate_fixed', models.IntegerField(default=100)),
                ('currently_enrolled', models.BooleanField(default=True)),
                ('date_left', models.DateField(blank=True, null=True)),
                ('reason_left', models.CharField(blank=True, choices=[('gone_to_regular_school', 'gone_to_regular_school'), ('started_work', 'started_work'), ('returned_to_village', 'returned_to_village'), ('returned_to_country', 'returned_to_country'), ('changed_location', 'changed_location'), ('stay_at_home', 'stay_at_home'), ('other', 'other')], max_length=30, null=True)),
                ('updated_last', models.DateField(auto_now=True)),
                ('updated_last_by', models.CharField(blank=True, max_length=255, null=True)),
                ('pkss_class', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classes.Class')),
                ('pkss_school', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schools.School')),
            ],
        ),
        migrations.CreateModel(
            name='StudentHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=datetime.date.today)),
                ('pkss_class', models.CharField(max_length=255)),
                ('created', models.DateField(auto_now_add=True)),
                ('student_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='students.Student')),
            ],
        ),
    ]
