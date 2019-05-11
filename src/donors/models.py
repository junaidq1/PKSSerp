from __future__ import unicode_literals

from django.db import models
import datetime

from django.db.models.signals import post_save
from django.db.models import Count, Sum, Avg, Max
from django.core.urlresolvers import reverse


# Create your models here.


class Donor(models.Model):
	reg = models.IntegerField()
	first_name = models.CharField(max_length=255)
	middle_name = models.CharField(max_length=120, null=True, blank=True)
	last_name = models.CharField(max_length=255)
	notes = models.TextField(max_length=2500, null=True, blank=True)
	city = models.CharField(max_length=120, null=True, blank=True)
	country = models.CharField(max_length=120, null=True, blank=True)
	email = models.CharField(max_length=120, null=True, blank=True)
	address = models.CharField(max_length=120, null=True, blank=True)
	phone = models.CharField(max_length=120, null=True, blank=True)
	title = models.CharField(max_length=120, null=True, blank=True)
	organization = models.CharField(max_length=120, null=True, blank=True)
	flagged = models.BooleanField(default=False)
	TIER_CHOICES = (
	    ('plantinum', 'plantinum'),
	    ('gold', 'gold'),
	    ('silver', 'silver'),
	    ('bronze', 'bronze'),
	)
	tier =  models.CharField(max_length=24, choices=TIER_CHOICES, null=True, blank=True)
	added = models.DateTimeField(auto_now=True, auto_now_add=False)
	regular_donor = models.BooleanField(default=False)
	DONATION_CYCLE = (
	    ('annual', 'annual'),
	    ('semi_annual', 'semi_annual'),
	    ('quarterly', 'quarterly'),
	)
	cycle = models.CharField(max_length=12, choices=DONATION_CYCLE, null=True, blank=True)
	last_donation_date = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=True)
	next_expected_date = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=True)

	@property
	def full_name(self):
		return ''.join([self.first_name, '_', self.last_name])

	def __unicode__(self):
		return self.full_name

	def __string__(self):
		return self.full_name

	# def get_absolute_url(self):
	# 	return reverse('', kwargs={"pk": self.pk} )

	# def go_to_forecast(self):
	# 	return reverse('')

class Donor_log(models.Model):
	contact_name = models.ForeignKey(Donor)
	donation_date = models.DateField(auto_now=False, auto_now_add=False, default = datetime.date.today)
	#contact_date = models.DateField(auto_now=False, auto_now_add=False, default = django.utils.timezone.now)
	FY_CHOICES = (
	    ('FY16', 'FY16'),
	    ('FY17', 'FY17'),
	    ('FY18', 'FY18'),
	)
	fiscal_year =  models.CharField(max_length=24, choices=FY_CHOICES, default='FY17')
	CURRENCY_CHOICES = (
	    ('PKR', 'PKR'),
	    ('USD', 'USD'),
	    ('UKP', 'UKP'),
	    ('Other', 'Other'),
	)
	currency =  models.CharField(max_length=10, choices=CURRENCY_CHOICES, default='PKR')
	amount_local_currency = models.IntegerField()
	conversion_rate_if_not_PKR = models.IntegerField(verbose_name="Enter conversation rate to PKR, enter 1 for PKR")
	amount_pkr = models.IntegerField(null=True, blank=True)
	donation_notes = models.TextField(max_length=2500, null=True, blank=True)
		 
	# def __unicode__(self):
	# 	return self.contact_name 

	def __string__(self):
		return self.contact_name

	# def get_absolute_url(self):
	# 	return reverse('', kwargs={"pk": self.contact_name_id})
	# 	return reverse("donor_profile", kwargs={"pk": self.pk} )


#signal receiver to update the donation amount in pkr
def updated_pkr_donation_value(sender, instance, **kwargs):
	am_pkr = instance.conversion_rate_if_not_PKR * instance.amount_local_currency
	Donor_log.objects.filter(id=instance.id).update(amount_pkr = am_pkr)

#this is a post save signal to calculate amount in pkr
post_save.connect(updated_pkr_donation_value, sender=Donor_log)
	
