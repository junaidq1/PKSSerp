import os
import sys

os.environ['DJANGO_SETTINGS_MODULE'] = 'PKSSerp.settings'
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__),"..")))
import django
django.setup()

from django.contrib.auth.models import User
from students.models import Student

class UserPopulating(object):
    print 1234
    students_list = list()
    for i in range(5, 105):
        name = "name %s" % i
        last_name = "last_name %s" % i
        student = Student(registration_number=99999,
                                         first_name=name,
                                         last_name=last_name,
                                         gender="male",
                                         pkss_school_id=1,
                                         pkss_class_id=1
                                         )
        students_list.append(student)
    Student.objects.bulk_create(students_list)

if __name__ == "__main__":
    UserPopulating()