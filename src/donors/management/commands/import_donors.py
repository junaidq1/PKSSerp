from django.core.management.base import BaseCommand, CommandError
import csv
from students.models import Student
from schools.models import School
from classes.models import Class
from donors.models import Donor, Donor_log
import datetime 


class Command(BaseCommand):

	def add_arguments(self, parser):
		parser.add_argument('csv_file', nargs='+', type=str)

	def handle(self, *args, **options):
		for csv_file in options['csv_file']:
			dataReader = csv.reader(open(csv_file), delimiter=',', quotechar='"')
			for row in dataReader:
				don = Donor()
				don.reg = row[0]
				don.first_name = row[2]
				don.middle_name = row[3]
				don.last_name = row[4]
				
				don.save()
				self.stdout.write(
					'Created donor {} {}'.format(don.first_name, don.last_name)
				)