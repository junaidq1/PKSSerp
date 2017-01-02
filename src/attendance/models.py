from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Attendance(models.Model):
	student = models.ForeignKey('students.Student')
	attendance_date = models.DateField(auto_now=False, auto_now_add=False)
	datestamp = models.DateField(auto_now=False, auto_now_add=True) 
	STATUS_CHOICES = (
		('present', 'present'),
		('absent', 'absent'),
	)
	status =  models.CharField(max_length=12, choices=STATUS_CHOICES, null=False, blank=False)
	notes = models.CharField(max_length=300, null=True, blank=True)

	class Meta: 
		unique_together = ("student", "attendance_date")

	@property
	def attendance_instance(self):
		return ''.join([self.student.full_name, '_',  self.status])

	def __unicode__(self):
		return self.attendance_instance

	def __string__(self):
		return self.attendance_instance