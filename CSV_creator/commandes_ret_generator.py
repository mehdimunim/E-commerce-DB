import csv
import context
from common import rand_date
from common import rand_hour


def commandes_ret_generator():
    """
    Generate commandes_val.CSV
    """
    header = ["Temps Commande", "Date commande",
              "Id du panier", "Id du client"]

    with open("CSV/commandes_val.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 10 000 entries in commandes_vals.csv
        for id_panier in range(10000):
            id_client = int(id_panier/10)
            row = [rand_hour(), rand_date(), id_panier, id_client]
            writer.writerow(row)


commandes_ret_generator()
