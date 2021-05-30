/* Requête avec agrégat 1*/

-- Les genres de livre les mieux vendus parmi ceux avec plus de 10 ventes au total :

\! echo "\nles genres de livre les mieux vendus parmi ceux avec plus de 10 ventes au total\n"
SELECT  S1.genre, ROUND(S1.count1/(1.0*S2.count2),1) AS "nombre de ventes par livre", S1.count1 AS "nombre de ventes"
FROM
-- nombre de ventes par genre
(SELECT genre, COUNT(genre) as count1
FROM produit_commande PC, livre
WHERE PC.id_produit = livre.id_livre
GROUP BY genre
-- au moins 10 ventes au total
HAVING COUNT(genre) > 10
ORDER BY count1
DESC
) AS S1
-- nombre de livres par genre
NATURAL JOIN
(SELECT genre, COUNT(genre) as count2
FROM livre
GROUP BY genre
ORDER BY count2
DESC
) AS S2
ORDER BY "nombre de ventes par livre"
DESC
;
