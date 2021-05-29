

\! echo "\nle nombre total de commandes pour chaque produit"

 SELECT id_produit, SUM(quantite) AS total
 FROM produit_commande
 GROUP BY id_produit;


 \! echo "\nles clients ayant commandé plus de 40 euros"

 SELECT prenom, nom, SUM(prix_commande)
 FROM client NATURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande)>40;