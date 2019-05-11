from django import forms
from .models import Attendance, AttendanceCalendar, NonScheduledHolidays
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout
from crispy_forms.bootstrap import InlineRadios, InlineCheckboxes
from datetimewidget.widgets import DateWidget

class AttendanceForm(forms.ModelForm):

	attendance_date = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))

	class Meta:
		model = Attendance
		fields = ("student", "attendance_date", "status", "notes")
		widgets = {
			'status': forms.RadioSelect()
			#'student': forms.TextInput()
		} 
		# # 	#'status': forms.RadioSelect() SelectMultiple()
		#  	'status': forms.RadioSelect() 
		# } 

	def __init__(self, *args, **kwargs):
		super(AttendanceForm, self).__init__(*args, **kwargs)
		self.fields['student'].widget.attrs['class'] = 'attendance_student'
		self.fields['student'].widget.attrs['disabled'] = True
		self.helper = FormHelper(self)
		#self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.form_style = 'inline'
		#self.helper.layout = Layout('student', 'attendance_date', InlineRadios('status'), 'notes')
		#self.helper[2] = InlineRadios('status')  # <- this should work but it doesn't
		

class AddAttCalDateForm(forms.ModelForm):
	class Meta:
		model = AttendanceCalendar
		fields = ["school", "first_day_of_month", "workdays_in_month"]
		
		widgets = {
			'first_day_of_month': DateWidget(usel10n=True, bootstrap_version=3)
		} 

class AddUnexpectedHolidayForm(forms.ModelForm):
	class Meta:
		model = NonScheduledHolidays
		fields = ["school", "holiday_date", "reason_for_holiday"]
		
		widgets = {
			'holiday_date': DateWidget(usel10n=True, bootstrap_version=3)
		} 