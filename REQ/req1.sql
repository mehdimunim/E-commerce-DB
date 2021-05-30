/* Requêtes sur trois tables */

/* Les clients qui ont commandé "Le Rouge et le Noir" */

\! echo "\nLes clients qui ont commandé \"Le Rouge et le Noir\"\n"
SELECT prenom, nom, client.id_client, mail
FROM client, livre, commande, produit_commande
WHERE  
produit_commande.id_commande = commande.id_commande
AND
commande.id_client = client.id_client
AND
produit_commande.id_produit = livre.id_livre
AND
titre = 'Le Rouge et le Noir'
;