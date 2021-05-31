/* Requête avec condition de totalité (agrégation)*/

/* Les clients qui ont acheté tous les livres de Stendhal disponibles*/

\! echo "\nLes clients qui ont acheté tous les livres de Stendhal disponibles\n"

SELECT nom, prenom, c.id_client
FROM produit_commande pc
JOIN commande c
ON  pc.id_commande = c.id_commande
JOIN livre l
ON 
pc.id_produit = l.id_livre
JOIN client cl 
ON c.id_client = cl.id_client
WHERE auteur = 'Stendhal'
GROUP BY c.id_client, nom, prenom 
HAVING COUNT(DISTINCT titre)
= 
(SELECT COUNT(DISTINCT titre)
FROM livre
WHERE auteur = 'Stendhal'
)
;
