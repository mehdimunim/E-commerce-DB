
 \! echo "\nles clients ayant commandé plus de 40 euros:\n"

 SELECT prenom, nom, SUM(prix_commande) AS "Prix total"
 FROM client NATURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande)>40;