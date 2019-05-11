from django import forms
from .models import TeacherAttendance
from datetimewidget.widgets import DateWidget

from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Fieldset, Div, Field, HTML


class TeacherAttendanceForm(forms.ModelForm):
    attendance_date = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    time_came_in = forms.TimeField(label="time", required=False,
                                   widget=forms.TextInput(attrs={'class':'time-picker',
                                                                 })
                                   )
    class Meta:
        model = TeacherAttendance
        fields = ("teacher", "attendance_date", "school_shift", "status", "time_came_in", "notes")
        widgets = {
        'status': forms.RadioSelect()
        #'student': forms.TextInput()
        }

    def __init__(self, *args, **kwargs):
        super(TeacherAttendanceForm, self).__init__(*args, **kwargs)
        self.fields['teacher'].widget.attrs['class'] = 'attendance_teacher'
        self.fields['school_shift'].widget.attrs['class'] = 'attendance_school'
        self.fields['teacher'].widget.attrs['disabled'] = True
        self.fields['school_shift'].widget.attrs['disabled'] = True
        self.helper = FormHelper(self)
        self.helper.form_tag = False
        self.helper.form_style = 'inline'








