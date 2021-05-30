/* Requête avec deux agrégats*/

/* La moyenne entre genres des dates maximales de publication*/

\! echo "\nLa moyenne entre genres des dates maximales de publication\n"
SELECT ROUND(AVG(S.max)) AS "moyenne des maximums"
FROM  
-- les date maximale de publication pour chaque genre
( 
    SELECT genre, MAX(date_publication) max
    FROM livre
    GROUP BY genre
) AS S
;
