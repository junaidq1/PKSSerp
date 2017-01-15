from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class 
# Create your views here.
from .models import Student
 
 
@login_required 
def search_students(request):
	queryset_list = Student.objects.all()
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

	return render(request, "student_list.html", context)
	#<a href='{% url "cont_detail" pk=obj.pk %}'> Select </a>

@login_required 
def student_profile_details(request, pk=None):
	std = get_object_or_404(Student, pk=pk) #student object
	#sch = School.objects.get(id = std.pkss_school_id) #school of object
	#cls = Class.objects.get(id= std.pkss_class_id)  #class of student

	context = {
	"student": std,  #update this
	#"class": cls,
	#"school": sch,
	}
	return render(request, "student_profule_details.html", context)