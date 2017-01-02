from __future__ import unicode_literals

from django.db.models.signals import post_save
from django.db import models

# Create your models here. 
 
class Teacher(models.Model):
	LEVEL_CHOICES = (
		('principal', 'principal'),
		('vice principal', 'vice principal'),
		('teacher', 'teacher'),
		('teacher aid', 'teacher aid'),
	)
	level = models.CharField(max_length=255, choices=LEVEL_CHOICES)
	first_name = models.CharField(max_length=255)
	last_name = models.CharField(max_length=255)
	GENDER_CHOICES = (
		('male', 'male'),
		('female', 'female'),
	)
	gender =  models.CharField(max_length=12, choices=GENDER_CHOICES, null=False, blank=False)
	pkss_school = models.ForeignKey('schools.School')
	date_joined = models.DateField(auto_now=False, auto_now_add=False)
	starting_salary = models.IntegerField(null=True, blank=True)
	current_salary = models.IntegerField(null=True, blank=True)
	address =  models.CharField(max_length=12, null=False, blank=False)

	@property
	def full_name(self):
		return ''.join([self.first_name, '_', self.last_name])

	def __unicode__(self):
		return self.full_name

	def __string__(self):
		return self.full_name



