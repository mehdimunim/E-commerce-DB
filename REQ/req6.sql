

\! echo "\nle nombre total de commandes pour chaque produit"

 SELECT type_produit AS "type", id_produit,SUM(quantite) AS total
 FROM produit_commande NATURAL JOIN produit
 GROUP BY "type",id_produit;




