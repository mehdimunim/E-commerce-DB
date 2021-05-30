/* Requête avec condition de totalité (agrégation)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

\! echo "\nLes clients qui ont acheté tous les livres de Stendhal disponibles\n"

SELECT id_client
FROM produit_commande pc
JOIN commande c
ON  pc.id_commande = c.id_commande
JOIN livre l
ON 
pc.id_produit = l.id_livre
WHERE auteur = 'Stendhal'
GROUP BY id_client 
HAVING COUNT(DISTINCT titre)
= 
(SELECT COUNT(DISTINCT titre)
FROM livre
WHERE auteur = 'Stendhal'
)
;
