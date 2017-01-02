from __future__ import unicode_literals

from django.db.models.signals import post_save
from django.db import models
from schools.models import School
# Create your models here.

class Class(models.Model):
	school = models.ForeignKey('schools.School')
	CLASS_CHOICES = (
		('Play Group', 'Play Group'),
		('Nursery', 'Nursery'),
		('M1', 'M1'),
		('M2', 'M2'),
		('Class 3', 'Class 3'),
		('Class 4', 'Class 4'),
		('Class 5', 'Class 5'),
	)
	class_name = models.CharField(max_length=255, choices=CLASS_CHOICES)
	SECTION_CHOICES = (
		('A', 'A'),
		('B', 'B'),
		('C', 'C'),
		('D', 'D'),
	)
	section = models.CharField(max_length=255, choices=SECTION_CHOICES, default='A')
	school_class_section = models.CharField(max_length=255, null=True, blank=True) 
	teacher = models.ForeignKey('teachers.Teacher') 

	def __unicode__(self):
		return self.school_class_section

	def __string__(self):
		return self.school_class_section

	class Meta:
		unique_together = ("school", "class_name", "section")

#this is signal receiver that updates the school_class_section field
def create_school_class_section_field(sender, instance, **kwargs):
	c_school = instance.school.school_name
	c_class = instance.class_name	
	c_section = instance.section
	concat = c_school + "_" + c_class + "_" + c_section
	Class.objects.filter(id=instance.id).update(school_class_section=concat)	

	
#this is a post save signal generator once a new master entry is made
post_save.connect(create_school_class_section_field, sender=Class)
 

