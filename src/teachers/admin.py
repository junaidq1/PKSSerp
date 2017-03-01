from django.contrib import admin

# Register your models here.

from .models import Teacher


class TeacherModelAdmin(admin.ModelAdmin):

	list_display = ['pk', 'get_user','first_name','last_name','level','gender','date_joined']
	list_display_links = ['first_name','last_name','level','gender','date_joined']
	search_fields = ['first_name','last_name','level','gender','date_joined']
	list_filter = ['first_name','last_name','level','gender','date_joined']
	
	class Meta:
		model = Teacher

	def get_user(self, obj): #to pull in foreign key
		return obj.user
	get_user.short_description = 'username'  #Renames column header

admin.site.register(Teacher, TeacherModelAdmin) 

