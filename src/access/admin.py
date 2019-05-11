from django.contrib import admin

from .models import UserAccess, SendDailyEmail
# Register your models here.

class UserAccessAdmin(admin.ModelAdmin):
	list_display = ['pk','user', 'access_level', 'created','updated']
	list_display_links = ['pk','user', 'access_level', 'created','updated']
	list_filter = ['access_level', 'created','updated']
	class Meta:
		model = UserAccess

admin.site.register(UserAccess, UserAccessAdmin)



class SendDailyEmailAdmin(admin.ModelAdmin):
	list_display = ['pk', 'first_name', 'last_name', 'email', 'created', 'updated']
	list_display_links = ['pk', 'first_name', 'last_name', 'email', 'created', 'updated']
	list_filter = ['first_name', 'last_name', 'email', 'created', 'updated']
	class Meta:
		model = SendDailyEmail

admin.site.register(SendDailyEmail, SendDailyEmailAdmin)
