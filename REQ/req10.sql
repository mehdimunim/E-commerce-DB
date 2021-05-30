/* Requête avec condition de totalité (sous requête corrélée)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

SELECT C.prenom, C.nom
FROM client C
WHERE
-- Il n'y a pas de livre de Stendhal qui ne se trouve pas dans les produits commandés du client
NOT EXISTS 
-- livres écrits par Stendhal
(SELECT DISTINCT l1.titre
FROM livre l1
WHERE l1.auteur = 'Stendhal'
AND l1.id_livre
NOT IN
-- produits commandés par le client
(
SELECT id_produit 
FROM produit_commande pc1
NATURAL JOIN commande c1
WHERE c1.id_client = C.id_client
)
)
;