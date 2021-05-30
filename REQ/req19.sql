\! echo "\nle nombre total de commandes pour chaque produit:\n"

 SELECT type_produit AS "type", id_produit,SUM(quantite) AS total
 FROM produit_commande NATURAL JOIN produit
 GROUP BY "type",id_produit
 ORDER BY total
 DESC
 ;
