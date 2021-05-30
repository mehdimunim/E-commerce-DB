/* Requêtes avec des NULL */

-- Nombre de livres traduits :

\! echo "\nLe nombre de livres traduits (requêtes avec NULL)\n"

SELECT COUNT(*) FROM livre;
SELECT COUNT(titre_original) FROM livre;

SELECT COUNT(*) FROM livre WHERE titre_original IS NOT NULL;
