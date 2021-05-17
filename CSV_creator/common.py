from random import randrange


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


def rand_date():
    """
    Generate random date between 01/05/2021 and 01/06/2020

    ---
    Output:

    Date in French format dd/mm/yyyy
    """
    day = randrange(1, 27)
    month = randrange(1, 12)
    year = randrange(2020, 2021)

    date = "{:02d}".format(day) + "/" + \
        "{:02d}".format(month) + "/" + "{:04d}".format(year)

    return date


def rand_price():
    """

    """


def rand_type():
    """

    """


def test_random():

    for i in range(10):
        print(rand_date())
        print(rand_hour())
        print()


# test_random()
