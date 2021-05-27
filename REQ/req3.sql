/* Sous-requête corrélée */
/* Les livres qui sont notés positivement par tous les clients */

SELECT titre
FROM livre, notation 
WHERE 
notation.id_produit = livre.id_livre
AND 
NOT EXISTS 
( SELECT id_client
    FROM notation
    WHERE note <= 5)
;