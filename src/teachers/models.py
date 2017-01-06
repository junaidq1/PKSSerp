from __future__ import unicode_literals
from django.db.models.signals import post_save
from django.db import models
from django.conf import settings
from schools.models import School


# Create your models here. 
 
   
class Teacher(models.Model):
        LEVEL_CHOICES = (
            ('management', 'management'),
            ('principal', 'principal'),
            ('vice principal', 'vice principal'),
            ('teacher', 'teacher'),
            ('teacher aid', 'teacher aid'),
        )

        user = models.OneToOneField(settings.AUTH_USER_MODEL, null=True, blank=True)
        level = models.CharField(max_length=255, choices=LEVEL_CHOICES)
        first_name = models.CharField(max_length=255)
        last_name = models.CharField(max_length=255)
        GENDER_CHOICES = (
            ('male', 'male'),
            ('female', 'female'),
        )
        gender =  models.CharField(max_length=12, choices=GENDER_CHOICES, null=False, blank=False)
        #pkss_school = models.ForeignKey('schools.School')
        pkss_school = models.ManyToManyField(School, blank=True)
        date_joined = models.DateField(auto_now=False, auto_now_add=False)
        starting_salary = models.IntegerField(null=True, blank=True)
        current_salary = models.IntegerField(null=True, blank=True)
        phone_number = models.CharField(max_length=15, null=False, blank=False) 
        address =  models.CharField(max_length=200, null=False, blank=False)
        starting_qualifications =  models.CharField(max_length=200, null=False, blank=False)
        current_qualifications =  models.CharField(max_length=200, null=False, blank=False)
        starting_years_experience =  models.IntegerField(null=True, blank=True)

        @property
        def full_name(self):
            return ''.join([self.first_name, '_', self.last_name])

        def __unicode__(self):
            return self.full_name

        def __string__(self):
            return self.full_name



