from django.contrib import admin

from .models import UserAccess
# Register your models here.

class UserAccessAdmin(admin.ModelAdmin):
	list_display = ['pk','user', 'access_level', 'created','updated']
	list_display_links = ['pk','user', 'access_level', 'created','updated']
	list_filter = ['access_level', 'created','updated']
	class Meta:
		model = UserAccess

admin.site.register(UserAccess, UserAccessAdmin)

