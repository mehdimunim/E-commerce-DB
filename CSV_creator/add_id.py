from csv import reader
from csv import writer
import os


def add_id(csv_name):
    """
    Add id column in csv
    ---
    Source: https://thispointer.com/python-add-a-column-to-an-existing-csv-file/
    """
    with open(csv_name, 'r') as read_obj, \
            open(csv_name + "_output", 'w', newline='') as write_obj:
        # Create a csv.reader object from the input file object
        csv_reader = reader(read_obj)
        # Create a csv.writer object from the output file object
        csv_writer = writer(write_obj)
        # Read each row of the input csv file as list
    for i, row in enumerate(csv_reader):
        new_row = [str(i)]
        new_row += row
        csv_writer.writerow(new_row)
    os.rm(csv_name)
    os.rename(csv_name + "ouput", csv_name)

# add_id("CSV")
