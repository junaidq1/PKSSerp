from django.contrib import admin

# Register your models here.
from .models import TeacherAttendance


class TeacherAttendanceModelAdmin(admin.ModelAdmin):

	list_display = ['pk', 'attendance_date','teacher', 'datestamp', 'status', 'notes', 'att_taker']
	list_display_links = ['pk','attendance_date','teacher', 'datestamp', 'status', 'notes', 'att_taker']
	search_fields = ['attendance_date', 'datestamp', 'status']
	list_filter = ['attendance_date', 'datestamp', 'status', 'teacher']
	
	class Meta:
		model = TeacherAttendance

admin.site.register(TeacherAttendance, TeacherAttendanceModelAdmin)

