
from django import forms
#import datetime
from django.forms import ModelForm
from datetimewidget.widgets import DateWidget

from .models import Donor, Donor_log


class DonorForm(forms.ModelForm):
	class Meta:
		model = Donor
		fields = ["reg","first_name", "last_name", "city", "country","email","address", "phone", 
		 "title","organization","tier", "flagged", "regular_donor", "cycle", "notes"]

class AddDonationForm(forms.ModelForm):
	class Meta:
		model = Donor_log
		fields = ["donation_date", "fiscal_year", "currency","amount_local_currency",
		 "conversion_rate_if_not_PKR","amount_pkr","donation_notes"]
		widgets = {
			'donation_date': DateWidget(usel10n=True, bootstrap_version=3)
		} 