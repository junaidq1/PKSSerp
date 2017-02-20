from __future__ import unicode_literals

from django.db import models
from django.db.models.signals import post_save, pre_save
from django.contrib.auth.models import User
from classes.models import Class
import datetime
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
	date_of_birth = models.DateField(auto_now=False, auto_now_add=False, default = datetime.date.today)
	place_of_birth = models.CharField(max_length=255, null=True, blank=True)
	fathers_name = models.CharField(max_length=255, null=True, blank=True)
	fathers_occupation = models.CharField(max_length=255, null=True, blank=True)
	mothers_name = models.CharField(max_length=255, null=True, blank=True)
	mothers_occupation = models.CharField(max_length=255, null=True, blank=True)
	address_current =  models.CharField(max_length=255, null=True, blank=True)
	address_origin =  models.CharField(max_length=255, null=True, blank=True)
	contact_number =  models.CharField(max_length=255, null=True, blank=True)
	emergency_contact_number =  models.CharField(max_length=255, null=True, blank=True)
	date_joined = models.DateField(auto_now=False, auto_now_add=False, default = datetime.date.today)
	pkss_school = models.ForeignKey('schools.School')
	pkss_class = models.ForeignKey('classes.Class')
	pkss_class_original = models.ForeignKey('classes.Class', related_name = 'pkss_class_original')
	enrollment_notes = models.TextField(max_length=2500, null=True, blank=True)
	FEE_CHOICES = (
		(0, 0),
		(25, 15),
		(50, 50),
		(100, 100),
	)
	fee_percent_rate_fixed = models.IntegerField(choices=FEE_CHOICES, null=False, blank=False, default=100)
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


class StudentHistory(models.Model):
	student_name = models.ForeignKey('Student')
	date = models.DateField(auto_now=False, auto_now_add=False, default = datetime.date.today) #date of enrollment or promotion
	pkss_class = models.CharField(max_length=255, null=False, blank=False)
	created = models.DateField(auto_now=False, auto_now_add=True) 

	def __string__(self):
		return self.student_name



#signal received to create a new student history object after the creation of a new student object
def create_a_student_history_object(sender, instance, **kwargs):
	s = StudentHistory.objects.filter(student_name_id = instance.id).order_by("-pk")
	#only create a new student hist instance if an existing one doesnt exist (not s checks for an empty dict)
	if not s: #if there is no prior record of this student
		if instance.pkss_class  == instance.pkss_class_original: #if current class = call student joined
			StudentHistory.objects.create(student_name=instance, date=instance.date_joined, pkss_class=instance.pkss_class)
		else: #if class joined and current class is different, create 2 entries, original and current
			StudentHistory.objects.create(student_name=instance, date=instance.date_joined, pkss_class=instance.pkss_class_original)
			StudentHistory.objects.create(student_name=instance, pkss_class=instance.pkss_class)
	else: #i.e. if there is a prior record of this student
		if s[0].pkss_class != Class.objects.get(id = instance.pkss_class_id).school_class_section: #i.e. if the save modification updated the class then create a new entry in studenthist
			StudentHistory.objects.create(student_name=instance, pkss_class=instance.pkss_class)

#post save signal to create a Student History object when a new student is created
post_save.connect(create_a_student_history_object, sender=Student)

#signal receiver to update the school the student is enrolled in based on the class
def updated_school_classification(sender, instance, **kwargs):
	Student.objects.filter(id=instance.id).update(pkss_school = instance.pkss_class.school )

#this is a pre save signal to assign a student to the right school based on the class they are ernolled in
post_save.connect(updated_school_classification, sender=Student)

 