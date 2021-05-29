/* Requête avec condition de totalité (sous requête corrélée)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

SELECT id_client
FROM (produit_commande pc
JOIN commande c
ON  pc.id_commande = c.id_commande
JOIN livre l
ON 
pc.id_produit = l.id_livre) J
WHERE
-- Il n'y a pas de livre de Stendhal qui ne se trouve pas dans les produits commandés du client
NOT EXISTS 
-- livres écrits par Stendhal
(SELECT DISTINCT id_produit
FROM livre
WHERE auteur = 'Stendhal'
AND id_produit
NOT IN
-- produits commandés par le client
(
SELECT id_produit 
FROM (produit_commande pc1
JOIN commande c1
ON  pc1.id_commande = c1.id_commande) J1
WHERE J.id_client = J1.id_client
)

)
;