import csv
import context
from common import rand_date
from common import rand_hour


def historique_prix_generator():
    """
    Generate historique_prix.csv

    """
    header = ["Type", "Id_prod",
              "Date", "Prix"]

    with open("CSV/historique_prix.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 1000 entries in historique_prix.csv
        for i in range(1000):
            id_prod = int(i/10)
            row = [rand_type_prod(), id_prod, rand_date(), rand_price()]
            writer.writerow(row)


historique_prix_generator()
