from django import forms
import datetime
from django.forms import ModelForm
from datetimewidget.widgets import DateWidget
from django.forms import SelectDateWidget
from schools.models import School

from .models import Student
#from datetimewidget.widgets import DateWidget


class StudentForm(forms.ModelForm):
	class Meta:
		model = Student
		fields = ["registration_number", "first_name", "last_name", "gender", "date_of_birth", "place_of_birth","fathers_name", 
		"mothers_name", "address_current", "address_origin", "contact_number", "emergency_contact_number",
		"date_joined", "pkss_school", "pkss_class", "pkss_class_original","fee_percent_rate_fixed", "enrollment_notes"]
		
		widgets = {
			'date_of_birth': SelectDateWidget(years=range(1995, 2025)),
			'date_joined': SelectDateWidget(years=range(1995, 2025))
		}

class StudentUnenrollForm(forms.ModelForm):
	class Meta:
		model = Student
		fields = ["currently_enrolled", "date_left","reason_left", "enrollment_notes"]
		
		widgets = {
			'date_left': DateWidget(usel10n=True, bootstrap_version=3)
		}

# class EnrollmentReportForm(forms.Form):
# 	PKSS_school = forms.ModelChoiceField(queryset = School.objects.all())
# 	Period_start_date = forms.DateField(attrs={'id': 'datepicker'})
# 	Period_end_date = forms.DateField(attrs={'id': 'datepicker2'})




