import csv
import context
from common import get_column


def produit_effectif():
    """
    Generate produit_effectif.csv 

    """

    header = ["Id_produit", "Disponible", "Delai", "Quantite"]

    ids_prod = get_column("Id_produit", "CSV/produit_commande.csv")

    dic = {}

    quantites_par_commande = get_column("Quantite", "CSV/produit_commande.csv")

    # loop over ids_commande to respect FK constraint

    for i, id_prod in enumerate(ids_prod):
        if id_prod in dic:
            dic[id_prod] += int(quantites_par_commande[i])+1
        else:
            dic.update({id_prod: 0})

    with open("CSV/produit_effectif.csv", "w", encoding="UTF8") as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for key, value in enumerate(dic):
            row = [key, "Oui", 0, value]
            writer.writerow(row)


produit_effectif()
