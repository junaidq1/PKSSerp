from django.core.management.base import BaseCommand, CommandError
import csv
from students.models import Student
from schools.models import School
from classes.models import Class
import datetime 


class Command(BaseCommand):

	def add_arguments(self, parser):
		parser.add_argument('csv_file', nargs='+', type=str)

	def handle(self, *args, **options):
		for csv_file in options['csv_file']:
			dataReader = csv.reader(open(csv_file), delimiter=',', quotechar='"')
			for row in dataReader:
				std = Student()
				std.registration_number = row[0]
				std.first_name = row[1]
				std.last_name = row[2]
				std.gender = row[3]
				#std.date_of_birth = row[4]
				std.date_of_birth = datetime.datetime.strptime(row[4], '%m/%d/%Y').date()
				std.place_of_birth = row[5]
				std.fathers_name = row[6]
				std.mothers_name = row[7]
				std.address_current = row[8]
				std.address_origin = row[9]
				std.contact_number = row[10]
				std.emergency_contact_number = row[11]
				#std.date_joined = row[12]
				std.date_joined = datetime.datetime.strptime(row[12], '%m/%d/%Y').date()
				std_school = School.objects.get(school_name=row[13])  #first get school name
				std.pkss_school =   std_school
				std_class = Class.objects.get(school_class_section=row[14])  #first get class name
				std.pkss_class = std_class
				std.fee_concession_percent = row[15]
				#std_class_orig = Class.objects.get(school_class_section=row[16]) 
				std.pkss_class_original = row[16]
				std.save()
				self.stdout.write(
					'Created student {} {}'.format(std.first_name, std.last_name)
				)