from unittest import TestCase
from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User, Permission
from visits.models import Visit, Client, Employee, Branch
from django.utils import timezone
import datetime


class VisitsTests(TestCase):
    def test_visits(self):
        return True
