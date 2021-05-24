import csv
import context
from common import rand_date
from common import rand_hour
from common import get_column
from common import rand_price


def commande_generator():
    """
    Generate commande.csv
    """
    header = ["id_commande", "date_commande", "id_panier", "id_client",
              "adresse_livraison", "prix", "mode_payement", "effectivement_paye"]

    ids_panier = get_column("id_panier", "CSV/panier.csv")

    ids_clients = get_column("id_client", "CSV/panier.csv")
    ids_commande = ids_panier[:int(len(ids_panier)/2)]

    with open("CSV/commande.csv", "w", encoding="UTF8") as f:
        writer = csv.writer(f)

        writer.writerow(header)

        # 10000 entries in commande.csv
        for i, id_commande in enumerate(ids_commande):
            id_panier = id_commande
            date_commande = rand_date()
            id_client = ids_clients[i]
            adresse_livraison = "adresse du client"
            prix = rand_price()
            if (prix > 2):
                mode_payement = "CB"
            elif (prix <= 2):
                mode_payement = "chèque"
            else:
                mode_payement = "espèces"
            effectivement_paye = "Oui"

            row = [id_commande, date_commande, id_panier, id_client,
                   adresse_livraison, prix, mode_payement, effectivement_paye]
            writer.writerow(row)


commande_generator()
