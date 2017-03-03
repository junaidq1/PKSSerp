from django import forms
import datetime
from django.forms import ModelForm
from datetimewidget.widgets import DateWidget
from django.forms import SelectDateWidget
from schools.models import School

from .models import Teacher
#from datetimewidget.widgets import DateWidget


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput())


class EditTeacherForm(forms.ModelForm):
	class Meta:
		model = Teacher 
		fields = ["first_name", "last_name", "gender", "pkss_school",  
		    "starting_salary","current_salary", "phone_number", "address","starting_qualifications",
		    "current_qualifications", "starting_years_experience", "notes"]
		
		widgets = {
			'date_joined': SelectDateWidget(years=range(1995, 2025))
		}
 

class AddTeacherForm(forms.ModelForm):
	class Meta:
		model = Teacher 
		fields = ["level", "first_name", "last_name", "gender", "pkss_school", "date_joined",  
		    "starting_salary","current_salary", "phone_number", "address","starting_qualifications",
		    "current_qualifications", "starting_years_experience", "notes"]
		
		widgets = {
			'date_joined': SelectDateWidget(years=range(1995, 2025))
		} 


class TeacherDeactivateForm(forms.ModelForm):
	class Meta:
		model = Teacher 
		fields = ["currently_active", "notes"]
		

# class EnrollmentReportForm(forms.Form):
# 	PKSS_school = forms.ModelChoiceField(queryset = School.objects.all())
# 	Period_start_date = forms.DateField(attrs={'id': 'datepicker'})
# 	Period_end_date = forms.DateField(attrs={'id': 'datepicker2'})




