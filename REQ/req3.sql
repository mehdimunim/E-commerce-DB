/* Sous-requête corrélée */

/* Les livres que tous les clients ont détesté */

\! echo "\nLes titres detestés par tous les clients\n"

SELECT titre, auteur
FROM livre 
WHERE id_livre
IN (
/* Les identifiants de ces produits*/
SELECT N.id_produit
FROM notation N 
WHERE 
NOT EXISTS
 (   SELECT id_client
    FROM notation N2
    WHERE N.id_produit = N2.id_produit
    AND
    N2.note >= 5)
)
;