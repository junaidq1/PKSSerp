from django.contrib import admin

# Register your models here.
from .models import School


class SchoolModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'school_name','shift','school_address','city','date_opened']
	list_display_links = ['pk', 'school_name','shift', 'school_address','city','date_opened']
	search_fields = ['school_name','shift', 'school_address','city','date_opened']
	list_filter = ['school_name','shift', 'city']
	class Meta:
		model = School

admin.site.register(School, SchoolModelAdmin) 

