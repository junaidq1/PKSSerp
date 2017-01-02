from __future__ import unicode_literals

from django.db import models

# Create your models here.

class School(models.Model):
	school_name = models.CharField(max_length=255)
	shift = models.CharField(max_length=255)
	school_address = models.CharField(max_length=255)
	city = models.CharField(max_length=255)
	date_opened = models.DateField(auto_now=False, auto_now_add=False)

	def __unicode__(self):
		return self.school_name

	def __string__(self):
		return self.school_name



	 