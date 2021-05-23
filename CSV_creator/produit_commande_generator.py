import csv
import context
from common import rand_price
from common import get_column
import random


def contenu_commandes_generator():
    """
    Generate contenu_commandes.csv

    """
    header = ["Id_produit", "Id_commande", "Id_client",
              "Date_commande", "Etat_produit", "Quantite"]

    # get_column is used to respect FK constraint

    ids_prod = get_column("Id_prod", "CSV/produit.csv")

    ids_commande = get_column("Id", "CSV/commande.csv")

    # Fetch quantite to abide by CHECK constraint

    quantites = get_column("Quantite", "CSV/produit_effectif.csv")

    with open("CSV/produit_commande.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # loop over ids_commande to respect FK constraint

        for id_commande in ids_commande:

            # choose 10 products

            k = random.randint(1, 10)
            ids_prod_chosen = random.choices(ids_prod, k=k)

            for i, id_prod in enumerate(ids_prod_chosen):

                # Tous les produits sont au moins une fois en cours de livraison
                row = [id_commande, id_prod, quantite]
                writer.writerow(row)


contenu_commandes_generator()
