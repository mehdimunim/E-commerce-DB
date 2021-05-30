/* Requête avec agrégat */

\! echo "\nnombre de produit mis dans le panier pour chaque produit:\n"


 SELECT id_prod, SUM(produit_dans_panier.quantite) AS "nombre total"
 FROM produit_dans_panier
 GROUP BY id_prod
 ORDER BY "nombre total";