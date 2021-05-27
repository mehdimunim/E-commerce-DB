/* Auto-jointure */
/* les titres français des livres qui existent à la fois en version original et traduite dans la base de données */

(
SELECT l1.titre --
FROM livre AS l1, livre AS l2
WHERE l1.titre = l2.titre_original
AND l1.langue = 'Français'
)
UNION 
( 
SELECT l2.titre
FROM livre AS l1, livre AS l2
WHERE l1.titre = l2.titre_original
AND l1.langue != 'Français'
)
;