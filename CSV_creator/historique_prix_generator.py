import csv
import context
from common import rand_date
from common import rand_hour
from common import rand_type
from common import rand_price
from common import rand_item
from common import get_column


def historique_prix_generator():
    """
    Generate historique_prix.csv

    """
    header = ["Id_prod",
              "Date", "Prix"]

    # Id Prod is FK from Livres UNION Périodiques
    ids_prod = get_column("ID", "CSV/livres.csv")
    #ids_prod += get_column("SICI", "CSV/periodiques.csv")

    # Limited set of dates
    dates = ["17/05/2021", "18/05/2021",
             "19/05/2021", "20/05/2021", "21/05/2021"]

    with open("CSV/historique_prix.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 5 entries by product
        for i in range(5):
            for id_prod in ids_prod:

                # random date
                date = dates[i]

                row = [id_prod, date, rand_price()]
                writer.writerow(row)


historique_prix_generator()
