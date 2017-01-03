
from django import forms
import datetime
#from django.contrib.admin.widgets import AdminDateWidget
from django.forms import ModelForm

from .models import Attendance


class AttendanceForm(forms.ModelForm):
	class Meta:
		model = Attendance
		fields = ("student","attendance_date", "status", "notes")


