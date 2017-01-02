from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Student(models.Model):
	first_name = models.CharField(max_length=255)
	last_name = models.CharField(max_length=255)
	GENDER_CHOICES = (
		('male', 'male'),
		('female', 'female'),
	)
	gender =  models.CharField(max_length=12, choices=GENDER_CHOICES, null=False, blank=False)
	date_of_birth = models.DateField(auto_now=False, auto_now_add=False)
	place_of_birth = models.CharField(max_length=255, null=True, blank=True)
	fathers_name = models.CharField(max_length=255, null=True, blank=True)
	mothers_name = models.CharField(max_length=255, null=True, blank=True)
	address_current =  models.CharField(max_length=255, null=True, blank=True)
	address_origin =  models.CharField(max_length=255, null=True, blank=True)
	contact_number =  models.CharField(max_length=255, null=True, blank=True)
	emergency_contact_number =  models.CharField(max_length=255, null=True, blank=True)
	date_joined = models.DateField(auto_now=False, auto_now_add=False)
	pkss_school = models.ForeignKey('schools.School')
	pkss_class = models.ForeignKey('classes.Class')
	enrollment_notes = models.TextField(max_length=2500, null=True, blank=True)
	fee_concession = models.IntegerField(null=True, blank=True)
	actual_fee_paid = models.IntegerField(null=True, blank=True)

	@property
	def full_name(self):
		return ''.join([self.first_name, '_', self.last_name])

	def __unicode__(self):
		return self.full_name

	def __string__(self):
		return self.full_name