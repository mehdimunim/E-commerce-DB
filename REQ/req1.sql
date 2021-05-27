/* Requêtes sur trois tables */
/* Les clients qui ont commandé "Le Rouge et le Noir" */

SELECT prenom_client, nom_client
FROM client, livre, commande, produit_commande
WHERE  
produit_commande.id_commande = commande.id_commande
AND
commande.id_client = client.id_client
AND
produit_commande.id_produit = livre.ID
AND
livre.TITRE = "Le Rouge et le Noir"
;