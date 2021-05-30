 /*Q13. Le prix moyen pour chaque type produit */
 SELECT produit.id_produit,produit.type_produit,AVG(prix_commande) AS "prix moyen"
 FROM commande NATURAL JOIN produit_commande NATURAL JOIN produit
 GROUP BY produit.type_produit,produit.id_produit
 ORDER BY produit.type_produit;