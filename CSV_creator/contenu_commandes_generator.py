import csv
import context
from common import rand_price
from common import get_column
import random


def contenu_commandes_generator():
    """
    Generate contenu_commandes.csv

    """
    header = ["Id commande", "Id Client", "Id produit",
              "Date commande", "Etat produit", "Quantité"]

    # Id Prod is FK from Livres UNION Périodiques
    ids_commande = get_column("ID", "CSV/commandes.csv")

    # clients between 1 and 1000 (see clients.csv)
    ids_client = get_column("ID", "CSV/commandes.csv")

    # dates des commandes correspondantes
    dates_commande = get_column("Date de commande", "CSV/commandes.csv")

    commandes_FK = [(ids_commande[i], ids_client[i], dates_commande[i])
                    for i, _ in enumerate(ids_client)]

    # les produits
    ids_prod = get_column("ID", "CSV/livres.csv")
    #ids_prod += get_column("SICI", "CSV/periodiques.csv")

    etats = ["disponible", "livré"]
    with open("CSV/contenu_commandes.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # récupère les trois clés étrangères de commandes
        for (id_commande, id_client, date_commande) in commandes_FK:
            random.shuffle(ids_prod.tomutable())
            for i in range(5):
                etat = etats[i % 2]
                id_prod = ids_prod[i]
                row = [id_commande, id_client,
                       date_commande, id_prod, etat, i]
                writer.writerow(row)


contenu_commandes_generator()
