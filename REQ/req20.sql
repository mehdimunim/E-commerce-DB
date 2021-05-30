/* Requêtes avec NULL */

-- Nombre de livres traduits :

SELECT COUNT(*) FROM livre;
SELECT COUNT(titre_original) FROM livre;

SELECT COUNT(*) FROM livre WHERE titre_original IS NOT NULL;