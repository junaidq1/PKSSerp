from __future__ import unicode_literals
from django.db.models.signals import post_save
from django.db import models
from django.conf import settings
from schools.models import School, SchoolShift


# Create your models here.
class Teacher(models.Model):
    LEVEL_CHOICES = (
        ('principal', 'principal'),
        ('vice principal', 'vice principal'),
        ('teacher', 'teacher'),
        ('teacher aid', 'teacher aid'),
        ('central office staff', 'central office staff'),
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
    pkss_school_shift = models.ManyToManyField(SchoolShift, blank=True)
    date_joined = models.DateField(auto_now=False, auto_now_add=False)
    starting_salary = models.IntegerField(null=True, blank=True)
    current_salary = models.IntegerField(null=True, blank=True)
    phone_number = models.CharField(max_length=15, null=False, blank=False)
    address =  models.CharField(max_length=200, null=False, blank=False)
    starting_qualifications =  models.CharField(max_length=200, null=False, blank=False)
    current_qualifications =  models.CharField(max_length=200, null=False, blank=False)
    starting_years_experience =  models.IntegerField(null=True, blank=True)
    currently_active = models.BooleanField(default=True)
    notes = models.TextField(max_length=2500, null=True, blank=True)
    updated_last = models.DateField(auto_now=True, auto_now_add=False)
    updated_last_by = models.CharField(max_length=255, null=True, blank=True)

    @property
    def full_name(self):
        return ''.join([self.first_name, '_', self.last_name])

    def __unicode__(self):
        return self.full_name

    def __string__(self):
        return self.full_name

    def has_access_to_school(self, school_id):
        user = self.user
        school_id = int(school_id)
        if user.useraccess.access_level == 'principal':
            school_shifts = self.pkss_school_shift.all()
            school_ids = [item.school.id for item in school_shifts.iterator()]
            if school_id in school_ids:
                return True
            else:
                return False
        else:
            return False

    def has_relation_to_school(self, school_id):
        school_id = int(school_id)
        school_shifts = self.pkss_school_shift.all()
        school_ids = [item.school.id for item in school_shifts.iterator()]
        if school_id in school_ids:
            return True
        else:
            return False

    def get_affilated_schools(self):
        school_shifts = self.pkss_school_shift.all()
        schools_ids = [item.school.id for item in school_shifts.iterator()]
        schools = School.objects.filter(id__in=schools_ids)
        return schools




