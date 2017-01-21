"""PKSSerp URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
""" 
from django.conf.urls import url, include
from django.contrib import admin

from attendance import views as att
from teachers.views import *
from students import views as st

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', att.go_home, name='user_homepage'),
    # url(r'^2$', att.go_home_2, name='user_homepage2'),
    # url(r'^attendance/$', att.add_attendance, name='add_attendance'),
    url(r'^affiliated_schools/$', att.affiliated_schools, name='affiliated_schools'),
    url(r'^attendance_dates/(?P<school_id>\d+)/$', att.attendance_dates, name='attendance_dates'),

    url(r'^attendance2/(?P<school_id>\d+)/(?P<date>\d{4}-\d{2}-\d{2})/$', att.add_attendance2, name='add_attendance2'),

    url(r'^attendance_report/$', att.attendance_report, name='attendance_report'),
    url(r'^attendance_summary/$', att.attendance_summary, name='attendance_summary'),
    url(r'^school_attendance_details/(?P<school_id>\d+)/(?P<date>.+)/$', att.school_attendance_details, name='school_attendance_details'),

    url(r'^attendance_by_month/$', att.attendance_by_month, name='attendance_by_school'),
    url(r'^attendance_by_school_month/$', att.attendance_by_school_month, name='attendance_by_school_month'),

    url(r'^login/', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    
    url(r'^search_students/$', st.search_students, name='search_student'),
    url(r'^student_profile/(?P<pk>\d+)/$', st.student_profile_details, name='std_profile'),
    url(r'^edit_student_profile/(?P<pk>\d+)/$', st.edit_student_record, name='edit_std_profile'),
    url(r'^unenroll_student_profile/(?P<pk>\d+)/$', st.unenroll_student, name='unenroll_std_profile'),
    url(r'^add_student/$', st.add_a_student, name='add_student'),
    #attendance cal -note: built in student views
    url(r'^attendance_calendar/$', st.view_attendance_calendar, name='attend_calendar'), #attendance cal summ view
    url(r'^add_cal_date/$', st.add_a_cal_date, name='add_cal_date'), #add cal date
    url(r'^edi_a_cal_date/(?P<pk>\d+)/(?P<month>\d+)/$', st.edit_school_caldate, name='edit_cal_date'), #edit cal date
    #school holidays
    url(r'^add_unexpected_holiday/$', st.add_unexpected_holiday, name='add_unexp_holiday'), #add unexp holiday
    url(r'^unexpected_holidays/$', st.view_unexpected_holidays_tot, name='unexp_holiday_rept'), #add unexp holiday
    url(r'^unexpected_holidays_deepdive/(?P<pk>\d+)/$', st.unexpected_holidays_deepdive, name='unexp_holiday_deepdive'),
    # url(r'^unexpected_holiday_report/$', st.view_unexpected_holidays_tot, name='unexp_holiday_rept'), #view unexp holiday summary
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
