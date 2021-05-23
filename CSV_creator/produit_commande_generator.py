import csv
import context
from common import get_column
import random


def produit_commande():
    """
    Generate contenu_commandes.csv

    """
    # get_column is used to respect FK constraint

    ids_prod = get_column("Id_prod", "CSV/produit.csv")

    ids_commande = get_column("Id_commande", "CSV/commande.csv")

    with open("CSV/produit_commande.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        # loop over ids_commande to respect FK constraint

        for id_commande in ids_commande:

            # choose k <= 10 products

            k = random.randint(1, 10)
            ids_prod_chosen = random.choices(ids_prod, k=k)

            # 1 or 2 products for small commandes but 1 for big ones
            if (k <= 2):
                quantite = random.randint(1, 2)
            else:
                quantite = 1
            for id_prod in ids_prod_chosen:

                row = [id_commande, id_prod, quantite]
                writer.writerow(row)


produit_commande()
