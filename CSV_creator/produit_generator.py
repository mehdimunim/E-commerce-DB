from common import get_column
import csv


def produit_generator():
    """
    Generate products
    """

    header = ["Id_prod", "Type"]

    # Id Prod is FK from Livres UNION Périodiques
    ids_prod_livre = get_column("Id", "CSV/livre.csv")
    ids_prod_periodique = get_column("Id", "CSV/numero_periodique.csv")

    with open("CSV/produit.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        last_id_livre = 0
        for id_prod in ids_prod_livre:
            row = [id_prod, "livre"]
            writer.writerow(row)
            last_id_livre = id_prod

        for id_prod in ids_prod_periodique:
            id_periodique = int(id_prod) + int(last_id_livre)
            row = [str(id_periodique), "periodique"]
            writer.writerow(row)


produit_generator()
