/* sous-rq dans FROM */
/* Le nombre moyen de livres par commande*/

\! echo "\nNombre moyen de livres par commande\n"

SELECT ROUND(AVG(nb_produit), 1) AS "moyenne"
FROM 
(SELECT COUNT(produit.id_produit) AS nb_produit
FROM produit_commande, produit
WHERE produit.id_produit =  produit_commande.id_produit
AND 
type_produit = 'livre'
GROUP BY id_commande
) AS S;