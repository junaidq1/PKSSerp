from django.contrib import admin

# Register your models here.
from .models import School, SchoolShift


class SchoolModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'school_name', 'school_address','city','date_opened']
	list_display_links = ['pk', 'school_name', 'school_address','city','date_opened']
	search_fields = ['school_name','shift', 'school_address','city','date_opened']
	list_filter = ['school_name', 'city']
	class Meta:
		model = School

admin.site.register(School, SchoolModelAdmin) 


class SchoolShiftAdmin(admin.ModelAdmin):
	list_display = [field.name for field in SchoolShift._meta.fields]
	search_fields = ['shift', 'school__school_name','school__shift', 'school__school_address','school__city','school__date_opened']
	list_filter = ['shift', 'school__school_name', 'school__city']
	class Meta:
		model = SchoolShift

admin.site.register(SchoolShift, SchoolShiftAdmin)
