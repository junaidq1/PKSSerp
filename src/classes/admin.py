from django.contrib import admin

# Register your models here.
from .models import Class


class ClassModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'school_class_section','class_name', 'section', 'teacher']
	list_display_links = ['pk', 'school_class_section','class_name', 'section','teacher']
	search_fields = [ 'class_name', 'section', 'teacher']
	list_filter = [ 'class_name', 'section', 'teacher']
	class Meta:
		model = Class

admin.site.register(Class, ClassModelAdmin) 








