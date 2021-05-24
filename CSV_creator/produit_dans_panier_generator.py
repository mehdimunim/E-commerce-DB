import csv
import context
from common import get_column


def produit_dans_panier_generator():
    """
    Generate produit_dans_panier.csv
    """
    header = ["id_produit", "id_panier", "quantite"]

    ids_produit = get_column("Id_produit", "CSV/produit_commande.csv")

    ids_panier = get_column("Id_commande", "CSV/produit_commande.csv")

    quantites = get_column("Quantite", "CSV/produit_commande.csv")

    with open("CSV/produit_dans_panier.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 10 000 entries in commandes_vals.csv
        for id_produit, id_panier, quantite in zip(ids_produit, ids_panier, quantites):
            row = [id_produit, id_panier, quantite]
            writer.writerow(row)


produit_dans_panier_generator()
