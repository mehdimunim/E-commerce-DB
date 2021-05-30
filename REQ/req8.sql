/*Lister tous les clients ayant effectuer une commande ou non et la liste de toutes les commandes associées à un client ou non*/

 SELECT prenom, nom, client.id_client,id_commande ,date_commande
 FROM client
 FULL JOIN ON commande client.id_client= commande.id_client