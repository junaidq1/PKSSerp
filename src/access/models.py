from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

# Create your models here.


#entension to the user model to manage the type of content folks can see on the website
class UserAccess(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	ACCESS_CHOICES = (
		('super', 'super'),
		('manager', 'manager'),
		('principal', 'principal'),
		('staff', 'staff'),
		('coordinator', 'coordinator'),
		('accountant', 'accountant'),
	)
	access_level = models.CharField(max_length=255, choices=ACCESS_CHOICES, default='staff')
	created = models.DateTimeField(auto_now=False, auto_now_add=True)
	updated = models.DateTimeField(auto_now=True, auto_now_add=False)


	def __unicode__(self):
		return self.access_level

	def __string__(self):
		return self.access_level


#this is the signal receiver that creates a new model instance for User access
def useraccess_post_save_receiver(sender, **kwargs):
	user = kwargs["instance"]
	if kwargs["created"]:
		user_access = UserAccess(user=user, access_level='staff')
		user_access.save()

#post save signal to create a UserAccess instance every time a new user is built
post_save.connect(useraccess_post_save_receiver, sender=User)
