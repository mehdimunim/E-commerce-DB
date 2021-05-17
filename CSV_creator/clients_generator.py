import context
import csv

def create_clients():
    """
    Script to create clients.csv
    recreates it if already created
    """

    with open("CSV/clients.csv", "w", encoding="UTF8") as f:

        # write the header
        writer = csv.writer(header)

        # create 1000 clients
        for i in range(1000):
            
            mail = get_mail()

            prenom = get_prenom()

            nom = get_nom()

            adresse = get_adresse()


