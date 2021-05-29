


/*Q1.  L'ensemble des clients ayant constituer des paniers contenant des livres de même genre*/

/*Q2.  Nom et prenom des clients avec leurs adresses correspondants*/

/*Q3. Rechercher tous les produits dont les quantités représentent  plus de 10% de la quantité totale.*/


/*Q4 Les clients ayant des prénom commençant par "D" et des noms commençant par "C"*/

/*Q5 Trouver les clients qui ont commander  des livres traduit en français*/


/*Q.6 
 -le nombre total de commandes pour chaque produit

 SELECT id_produit, SUM(quantite)
 FROM produit_commande
 GROUP BY id_produit


 - les clients ayant commandé plus de 40 euros

 SELECT prenom, nom, SUM(prix_commande)
 FROM client NaTURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande) > 40


 */

/*Q7 listes des livres commandés par tous les clients */



 /*Q.8 Lister tous les clients ayant effectuer une commande ou non et la liste de toutes les commandes associées à un client ou nom

 SELECT prenom, nom, client.id_client,id_commande ,date_commande
 FROM client
 FULL JOIN commande ON client.id_client= commande.id_client;

 /*Q.9


 /*Q10 Le pourcentage de livre commandé par les clients */

 /*Q11 la nombre moyen de périodiques et de livre mis dans le panier par les clients */

 /*Q12 le pourcentage de clients ayant passé une commande supérieur ou égale 50 euros*/


 /*Q13. Le prix moyen des produits */

 /*Q14 le produit le plus cher */

 /*Q15 le produit le plus acheté */

 /*Q16 le produit le mieux noté*/

 /*Q17 Le produit 




