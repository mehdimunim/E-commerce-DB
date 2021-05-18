import csv
import context
from common import rand_price
from common import get_column


def contenu_commandes_generator():
    """
    Generate contenu_commandes.csv

    """
    header = ["Id commande", "Id Client", "Id produit",
              "Date commande", "Etat produit", "Quantité"]

    # Id Prod is FK from Livres UNION Périodiques
    ids_commande = get_column("ID", "CSV/commandes.csv")

    ids_client = [i+1 for i in range(1000)]

    ids_prod = get_column("ID", "CSV/livres.csv")
    #ids_prod += get_column("SICI", "CSV/periodiques.csv")

    # Limited set of dates
    dates = ["17/05/2021", "18/05/2021",
             "19/05/2021", "20/05/2021", "21/05/2021"]

    etat = ["disponible", "livré"]
    with open("CSV/contenu_commandes.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 5 entries by product
        for i in range(5):
            for id_prod in ids_prod:

                # random date
                date = dates[i]

                row = [id_prod, date, rand_price()]
                writer.writerow(row)


contenu_commandes_generator()
