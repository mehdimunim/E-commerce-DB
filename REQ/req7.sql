/* Requête avec aggrégat 2 */

/* Le nombre de livres traduits en français par langue d'origine*/


\! echo "\nLe nombre de livres traduits en français par langue d'origine\n"

SELECT langue_origine, COUNT(langue_origine) nombre_traductions_fr
FROM livre
GROUP BY langue_origine, langue
HAVING langue = 'Français' 
AND langue_origine != 'Français'
ORDER BY nombre_traductions_fr
DESC
;
