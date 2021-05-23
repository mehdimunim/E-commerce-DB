import csv


def commande_generator():
    """
    Generate temp.csv
    """
    with open("CSV/temp.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        for i in range(10000):
            row = [i+1, ""]
            writer.writerow(row)


commande_generator()
