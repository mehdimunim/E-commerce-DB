/* Sous-requête corrélée */
/* Les livres qui sont notés positivement par tous les clients */

SELECT titre
FROM livre, notation, 
WHERE 
notation.id = livre.id
AND 
NOT EXIST 
( SELECT id_client
    FROM notation
    WHERE notation.note < 5)
;