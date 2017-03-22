from __future__ import unicode_literals
import datetime
from django.db import models

# Create your models here.
class Attendance(models.Model):
	student = models.ForeignKey('students.Student')
	attendance_date = models.DateField(auto_now=False, auto_now_add=False)
	datestamp = models.DateField(auto_now=False, auto_now_add=True) 
	datestamp_change = models.DateTimeField(auto_now=True, auto_now_add=False) 
	STATUS_CHOICES = (
		('present', 'present'),
		('absent', 'absent'),
	)

	status =  models.CharField(max_length=7, choices=STATUS_CHOICES, default='absent')
	notes = models.CharField(max_length=100, null=True, blank=True)
	att_taker = models.CharField(max_length=120, null=True, blank=True)

	class Meta: 
		unique_together = ("student", "attendance_date")

	@property
	def attendance_instance(self):
		return ''.join([self.student.full_name, '_',  self.status])

	def __unicode__(self):
		return self.attendance_instance

	def __string__(self):
		return self.attendance_instance 


class AttendanceCalendar(models.Model):
	school = models.ForeignKey('schools.School')
	first_day_of_month = models.DateField(auto_now=False, auto_now_add=False)
	workdays_in_month =  models.IntegerField(null=False, blank=False)
	non_weekend_workdays_off = models.IntegerField(null=True, blank=True)

	class Meta:
		unique_together = ("school", "first_day_of_month")

	def __unicode__(self):
		return self.school.school_name

	def __str__(self):
		return self.school.school_name

	def goto_att_cal(self):
		return reverse('attend_calendar')

class NonScheduledHolidays(models.Model):
	school = models.ForeignKey('schools.School')
	holiday_date = models.DateField(auto_now=False, auto_now_add=False, default = datetime.date.today)
	reason_for_holiday = models.TextField(max_length=700, null=False, blank=False) 

	class Meta:
		unique_together = ("school", "holiday_date")