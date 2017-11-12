from django.contrib import admin

# Register your models here.
from .models import Class


class ClassModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'school','school_class_section','class_name', 'section','shift', ]
	list_display_links = ['pk', 'school','school_class_section','class_name', 'section','shift',]
	search_fields = [ 'school','class_name', 'section' ]
	list_filter = [ 'school','class_name', 'section', 'shift' ]
	
	class Meta:
		model = Class


admin.site.register(Class, ClassModelAdmin) 








