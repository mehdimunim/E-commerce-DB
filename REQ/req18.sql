-- le nombre total de commandes pour chaque type de produit :

\! echo "\nle nombre total de commandes pour chaque type de produit:\n"

SELECT type_produit AS "type", SUM(quantite) AS total
FROM produit_commande NATURAL JOIN produit
GROUP BY "type";
