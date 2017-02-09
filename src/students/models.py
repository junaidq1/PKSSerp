from __future__ import unicode_literals

from django.db import models
from django.db.models.signals import post_save, pre_save
from django.contrib.auth.models import User
from classes.models import Class
# Create your models here.

class Student(models.Model):
	registration_number = models.IntegerField(null=False, blank=False)
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
	fee_concession_percent = models.IntegerField(null=True, blank=True)
	currently_enrolled = models.BooleanField(default=True)
	date_left = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=True)
	REASON_LEFT_CHOICES = (
		('gone_to_regular_school', 'gone_to_regular_school'),
		('started_work', 'started_work'),
		('returned_to_village', 'returned_to_village'),
		('returned_to_country', 'returned_to_country'),
		('changed_location', 'changed_location'),
		('stay_at_home', 'stay_at_home'),
		('other', 'other'),
	)
	reason_left =  models.CharField(max_length=30, choices=REASON_LEFT_CHOICES, null=True, blank=True)
	updated_last = models.DateField(auto_now=True, auto_now_add=False)
	updated_last_by = models.CharField(max_length=255, null=True, blank=True)


	@property
	def full_name(self):
		return ''.join([self.first_name, '_', self.last_name])

	def __unicode__(self):
		return self.full_name

	def __string__(self):
		return self.full_name

	def get_absolute_url(self):
		return reverse("student_profile", kwargs={"pk": self.pk} ) 

# #this is signal receiver that updates the updated_last_by field when a student model is modified
# def update_student_model(sender, instance, **kwargs):
# 	user = instance.user
# 	Student.objects.filter(id=instance.id).update(updated_last_by=user)
# 	print "user" + " " + user
# 	print "instance" + " " + Student.objects.get(id=instance.id)

# #this is a post save signal generator once a student object is created or modified
# post_save.connect(update_student_model, sender=Student)


#signal receiver to update the school the student is enrolled in based on the class
def updated_school_classification(sender, instance, **kwargs):
	Student.objects.filter(id=instance.id).update(pkss_school = instance.pkss_class.school )

#this is a pre save signal to assign a student to the right school based on the class they are ernolled in
post_save.connect(updated_school_classification, sender=Student)

 