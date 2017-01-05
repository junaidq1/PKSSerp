from django import forms
from .models import Attendance


class AttendanceForm(forms.ModelForm):

    attendance_date = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))

    class Meta:
        model = Attendance
        fields = ("student", "attendance_date", "status", "notes")

    def __init__(self, *args, **kwargs):
        super(AttendanceForm, self).__init__(*args, **kwargs)
        self.fields['student'].widget.attrs['class'] = 'attendance_student'
        self.fields['student'].widget.attrs['disabled'] = True

