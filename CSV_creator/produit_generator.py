from .common import get_column
import csv


def produit_generator():
    """
    Generate products
    """

    header = ["Id_prod", "Type"]

    # Id Prod is FK from Livres UNION Périodiques
    ids_prod_livre = get_column("ID", "CSV/livre.csv")
    ids_prod_periodique = get_column("ID", "CSV/periodique.csv")

    with open("CSV/produit.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        for id_prod in ids_prod_livre:
            row = [id_prod, "livre"]
            writer.writerow(row)
        for id_prod in ids_prod_periodique:
            row = [id_prod, "periodique"]
            writer.writerow(row)


produit_generator()
