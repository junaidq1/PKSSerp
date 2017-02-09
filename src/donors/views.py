
from django.shortcuts import render, get_object_or_404, redirect, reverse
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class
from django.db import connection  #for custom SQL 
# Create your views here.
from students.models import Student
from attendance.models import AttendanceCalendar, NonScheduledHolidays
from schools.models import School
from attendance.forms import AddAttCalDateForm, AddUnexpectedHolidayForm
from datetime import datetime, timedelta
from .models import Donor, Donor_log
from donors.forms import DonorForm, AddDonationForm

#enter new donation
@login_required 
def search_for_donors(request): 
	queryset_list = Donor.objects.all()
	query = request.GET.get("q1")
	if query:
		queryset_list = queryset_list.filter(
						Q(first_name__icontains=query) | Q(last_name__icontains=query)
						)
		#print queryset_list
	context = {
	"queryset_list":queryset_list,
	"query": query
	}

	return render(request, "donor_list.html", context) 

#Add a donor
@login_required
def add_a_donor(request): 
	form = DonorForm(request.POST or None, request.FILES or None)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( reverse('donor_profile', kwargs={'pk': instance.pk}))
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
	}
	return render(request, "add_donor.html", context)


#view profile details for donor
@login_required 
def donor_profile_details(request, pk=None):
	don = get_object_or_404(Donor, pk=pk) #student object
	#sch = School.objects.get(id = std.pkss_school_id) #school of object
	#cls = Class.objects.get(id= std.pkss_class_id)  #class of student
	don_hist = Donor_log.objects.filter(contact_name = pk).order_by('-donation_date')
	tot_given = don_hist.aggregate(Sum('amount_pkr')).values()[0]

	context = {
	"don": don,
	"don_hist": don_hist,
	"tot_given": tot_given,
	}
	return render(request, "donor_profile_details.html", context)

#add donation from donor
@login_required
def add_donation(request, pk=None):
	don = get_object_or_404(Donor, pk=pk)
	form = AddDonationForm(request.POST or None)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.contact_name = Donor.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( reverse('donor_profile', kwargs={'pk': don.pk}))
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
		"don": don,
	}
	return render(request, "add_a_donation_amount.html", context)

#edit donor profile
@login_required
def edit_donor_profile(request, pk=None):
	don = get_object_or_404(Donor, pk=pk)
	form = DonorForm(request.POST or None, request.FILES or None, instance=don)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( reverse('donor_profile', kwargs={'pk': don.pk}) )
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
		"don": don,
	}
	return render(request, "edit_donor_profile.html", context)


# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
	#Return all rows from a cursor as a dict
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]

#view periodic donations
@login_required 
def view_donations_in_period(request): 
	donations_list = Donor_log.objects.filter(donation_date__lt ='1990-01-01') 
	tot_given = 0
	#query = request.GET.get("q1")
	start = request.GET.get("q1")
	end = request.GET.get("q2")
	
	if start is not None:
		donations_list = Donor_log.objects.filter(donation_date__gte =start).filter(donation_date__lte =end).order_by('-donation_date')
		tot_given = donations_list.aggregate(Sum('amount_pkr')).values()[0]
	# cursor = connection.cursor()
	# cursor.execute(
	# '''SELECT *
	# FROM donors_donor_log AS A
	# WHERE (donation_date > %s) AND ( donation_date < %s);''', [start, end])

	# donations_list = dictfetchall(cursor)

	context = {
	"donations_list": donations_list,
	"start": start,
	"end": end,
	"tot_given": tot_given,
	}

	return render(request, "donations_in_period.html", context) 
