/* Requête avec agrégat 3 */
-- Les clients ayant commandé plus de 120 euros :

\! echo "\nles clients ayant commandé plus de 120 euros:\n"
 SELECT prenom, nom, SUM(prix_commande) AS "prix_total"
 FROM client NATURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande)>120
 ORDER BY prix_total;
 