from __future__ import unicode_literals

from django.db import models
from django.db.models.signals import post_save


# Create your models here.

class School(models.Model):
    school_name = models.CharField(max_length=255)
    school_address = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    date_opened = models.DateField(auto_now=False, auto_now_add=False)
    school_notes = models.TextField(max_length=2500, null=True, blank=True)

    def __unicode__(self):
        return self.school_name

    def __string__(self):
        return self.school_name


def school_post_save(sender, instance, created, **kwargs):
    if created:
        shifts = SHIFT_CHOICES
        for shift in shifts:
            SchoolShift.objects.create(school=instance, shift=shift[0])

post_save.connect(school_post_save, sender=School)


SHIFT_CHOICES = (
    ('morning', 'morning'),
    ('evening', 'evening'),
)

class SchoolShift(models.Model):
    school = models.ForeignKey(School, blank=True, null=True, default=None)
    shift = models.CharField(max_length=32, choices=SHIFT_CHOICES)

    def __unicode__(self):
        return "%s: %s" % (self.school.school_name, self.shift)

