# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-19 17:46
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('teachers', '0004_auto_20170105_2255'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeacherAttendance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('attendance_date', models.DateField()),
                ('datestamp', models.DateField(auto_now_add=True)),
                ('datestamp_change', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(choices=[('present', 'present'), ('absent', 'absent')], default='absent', max_length=7)),
                ('notes', models.CharField(blank=True, max_length=150, null=True)),
                ('att_taker', models.CharField(blank=True, max_length=120, null=True)),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teachers.Teacher')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='teacherattendance',
            unique_together=set([('teacher', 'attendance_date')]),
        ),
    ]
