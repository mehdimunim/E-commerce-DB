/* Auto-jointure */
/* les livres qui existent à la fois en version original et traduite dans la base de  */

SELECT titre
FROM livre AS l1, livre AS l2
WHERE l1.titre = l2.titre_original
;