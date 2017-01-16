from django import forms
import datetime
from django.forms import ModelForm
from datetimewidget.widgets import DateWidget

from .models import Student
#from datetimewidget.widgets import DateWidget


class StudentForm(forms.ModelForm):
	class Meta:
		model = Student
		fields = ["registration_number", "first_name", "last_name", "gender", "date_of_birth", "place_of_birth","fathers_name", 
		"mothers_name", "address_current", "address_origin", "contact_number", "emergency_contact_number",
		"date_joined", "pkss_school", "pkss_class", "fee_concession_percent", "enrollment_notes"]
		
    	widgets = {
			'date_joined': DateWidget(usel10n=True, bootstrap_version=3)
		}

class StudentUnenrollForm(forms.ModelForm):
	class Meta:
		model = Student
		fields = ["currently_enrolled", "date_left","reason_left"]
		
		widgets = {
			'date_left': DateWidget(usel10n=True, bootstrap_version=3)
		} 