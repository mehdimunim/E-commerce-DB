/* LEFT JOIN*/

-- Envoyer un email de PUB aux clients qui n'ont jamais fait de commande :

SELECT client.id_client, nom, prenom, mail FROM client 
    LEFT JOIN commande ON client.id_client = commande.id_client 
    WHERE commande.id_client is NULL;

