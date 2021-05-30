
 /*Q10 liste des livres qui ne sont commandé par aucun client */
  
\! echo "\nliste des livres qui ne sont commandés par aucun client:\n"

 SELECT titre,id_livre 
 FROM livre 
 WHERE id_livre 
 NOT IN ( SELECT id_produit
          FROM produit_commande
 );

 /* Requête avec condition de totalité (sous requête corrélée)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

SELECT C.id_client
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