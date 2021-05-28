/* Requêtes avec agrégat 1*/


/* Les genres de livre les mieux vendus (le plus de commande) */

SELECT COUNT(genre) as count
FROM produit_commande PC, livre
WHERE PC.id_produit = livre.id_livre
GROUP BY genre
ORDER BY count
DESC;