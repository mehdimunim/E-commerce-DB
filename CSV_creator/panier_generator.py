import csv
import context
from common import get_column


def panier_generator():
    """
    Generate panier.csv
    """
    header = ["id_panier", "id_client"]

    ids_client = get_column("id_client", "CSV/client.csv")

    n_client = len(ids_client)
    with open("CSV/panier.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 10 000 entries in panier.csv
        for id_panier in range(1, 10000):

            # 10 paniers pour chaque client
            id_client = ids_client[id_panier % n_client]
            row = [id_panier, id_client]
            writer.writerow(row)


panier_generator()
