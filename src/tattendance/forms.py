from django import forms
from .models import TeacherAttendance
from crispy_forms.helper import FormHelper
from datetimewidget.widgets import DateWidget

class TeacherAttendanceForm(forms.ModelForm):

	attendance_date = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))

	class Meta:
		model = TeacherAttendance
		fields = ("teacher", "attendance_date", "school", "status", "notes")

	def __init__(self, *args, **kwargs):
		super(TeacherAttendanceForm, self).__init__(*args, **kwargs)
		self.fields['teacher'].widget.attrs['disabled'] = True
		self.fields['school'].widget.attrs['disabled'] = True
		self.helper = FormHelper(self)
		#self.helper = FormHelper()
		self.helper.form_tag = False
		self.helper.form_style = 'inline'

