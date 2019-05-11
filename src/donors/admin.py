from django.contrib import admin

# Register your models here.
from .models import Donor, Donor_log

class DonorModelAdmin(admin.ModelAdmin):
	list_display = ['pk','first_name', 'last_name','city','tier' ,'flagged','notes', 'regular_donor', 'cycle', 'last_donation_date','next_expected_date']
	list_display_links = ['pk','first_name', 'last_name','city', 'tier' ,'flagged','notes','regular_donor', 'cycle', 'last_donation_date','next_expected_date']
	search_fields = ['pk','first_name', 'last_name','city', 'tier' ,'flagged','notes']
	list_filter = ['city', 'tier' ,'flagged','city', 'regular_donor', 'cycle',]
	class Meta:
		model = Donor

admin.site.register(Donor, DonorModelAdmin)

class Donor_logModelAdmin(admin.ModelAdmin):
	list_display = ['pk','contact_name','donation_date', 'fiscal_year','currency','amount_local_currency','conversion_rate_if_not_PKR','amount_pkr']
	list_display_links = ['pk','contact_name','donation_date', 'fiscal_year','currency','amount_local_currency','conversion_rate_if_not_PKR','amount_pkr']
	search_fields = ['pk','contact_name','donation_date', 'fiscal_year','currency','amount_local_currency','conversion_rate_if_not_PKR','amount_pkr']
	list_filter = ['fiscal_year','currency']
	class Meta:
		model = Donor_log

	# def get_tier(self, obj): #to pull in foreign key
	# 	return obj.donor.tier
	
admin.site.register(Donor_log, Donor_logModelAdmin)
 