
/* Requête avec jointure externe*/

/* FULL JOIN*/

/*10 clients ayant effectué une commande ou non et la liste de toutes les commandes associées à un client ou non*/

 SELECT prenom, nom, client.id_client,id_commande ,date_commande
 FROM client
 FULL JOIN commande ON client.id_client= commande.id_client
 LIMIT 10
;
