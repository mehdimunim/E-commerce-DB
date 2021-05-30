/* Requête avec condition de totalité (agrégation)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

SELECT c.prenom, c.nom
FROM produit_commande pc
NATURAL JOIN client c
JOIN livre l
ON 
pc.id_produit = l.id_livre
WHERE auteur = 'Stendhal'
GROUP BY c.id_client 
HAVING COUNT(DISTINCT titre)
= 
(SELECT COUNT(DISTINCT titre)
FROM livre
WHERE auteur = 'Stendhal');
