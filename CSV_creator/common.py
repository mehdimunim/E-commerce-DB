import csv
import datetime
from random import randrange
import random
from faker import Faker
from datetime import date


def rand_hour():
    """
    Generates random time (hour:minute:second) between 00:00:00 and 23:59:59

    ---
    Output:

    String hh:mm:ss

    """

    hour = randrange(0, 23)
    minute = randrange(0, 59)
    second = randrange(0, 59)

    time = "{:02d}".format(
        hour) + ":" + "{:02d}".format(minute) + ":" + "{:02d}".format(second)

    return time


def rand_date(start="01/05/2020", end="01/06/2020"):
    """
    Get a random date between start and end

    ---
    Parameters:
    start, end: two strings representing dates

    ---
    Return:
    string formatted date_between
    date_between : random datetime object between start and end
    """
    # get day, month and year as strings
    start_day, start_month, start_year = start.split("/")
    end_day, end_month, end_year = end.split("/")

    # convert theme to date
    start_date = date(year=int(start_year), month=int(
        start_month), day=int(start_day))
    end_date = date(
        year=int(end_year),
        month=int(end_month),
        day=int(end_day)
    )

    fake = Faker()

    date_between = fake.date_between(start_date=start_date, end_date=end_date)

    return date_between.strftime('%d/%m/%Y')


def rand_price():
    """
    Generate random price from books and magazines

    ---
    Return:
    price between 0.99 and 30.00

    """

    price = int(3000*random.random()+99)/100

    return price


def rand_type():
    """
    Generate random type for product

    ---
    Return:
    type between "livre", "magazine", "revue"
    """

    type = random.choice(["livre", "magazine", "revue"])

    return type


# Functions used to respect FK constraints


def get_column(column_label, table):
    """
    Get all items at column column_label in table

    ---
    Parameters:
    column_label: name of the column
    talbe: CSV file with a header

    ---
    Return:
    column: list of all items in column_label

    """
    list = []
    with open(table, "r") as f:
        reader = csv.DictReader(f, delimiter=",")
        for lines in reader:
            list.append(lines[column_label])

    return list


def rand_item(list):
    """
    Get random item from list
    """
    return random.choice(list)
#
# TEST
#


def test_random():

    for i in range(10):
        print(rand_date())
        print(rand_type())
        print()


# test_random()
