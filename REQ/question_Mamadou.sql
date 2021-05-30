


/*Q1.  L'ensemble des clients ayant constituer des paniers contenant des livres de même genre*/

/*Q2.  Nom et prenom des clients avec leurs adresses correspondants*/

/*Q3. Rechercher tous les produits dont les quantités représentent  plus de 10% de la quantité totale.*/


/*Q4 Les clients ayant des prénom commençant par "D" et des noms commençant par "C"*/

/*Q5 Trouver les clients qui ont commander  des livres traduit en français*/


/*Q.6 
 -le nombre total de commandes pour chaque produit*/

 SELECT id_produit, SUM(quantite) AS total
 FROM produit_commande
 GROUP BY id_produit


 /*- les clients ayant commandé plus de 40 euros*/

 SELECT prenom, nom, SUM(prix_commande)
 FROM client NaTURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande) > 40


 

/*Q7 listes des livres commandés par tous les clients */



 /*Q.8 Lister tous les clients ayant effectuer une commande ou non et la liste de toutes les commandes associées à un client ou non*/

 SELECT prenom, nom, client.id_client,id_commande ,date_commande
 FROM client
 NATURAL JOIN commande client.id_client= commande.id_client;

 /*Q.9


 /*Q10 liste des livres qui ne sont commandé par aucun client */


 SELECT id_livre 
 FROM livre 
 WHERE id_livre 
 NOT IN ( SELECT id_produit
          FROM produit_commande
 );




 

 /*Q11 la nombre total de périodique mis dans le panier pour chaque type */

 SELECT id_produit, SUM(produit_dans_panier.quantite) AS "nombre total"
 FROM produit_dans_panier
 GROUP BY id_produit;


 /*Q12 le pourcentage de clients ayant passé une commande supérieur ou égale 50 euros*/

 SELECT count(id_client) AS "nombre total", SUM(prix_commande)
 FROM commande
 HAVING SUM(prix_commande);



 /*Q13. Le prix moyen des produits */


 /*Q14 le produit le plus cher */

 /*Q15 le produit le plus acheté */

 /*Q16 le produit le mieux noté*/

 /*Q17 Les clients ayant apprécié les livres et detesté les périodiques*/

 /*Q18 La note moyenne donnée aux produit */

 /* Q19 le taux produit retourné */


/*Q20 les clients ayant passé plus 10 commandes dont 3 livres et 7 périodiques*/





