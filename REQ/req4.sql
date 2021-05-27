/* sous-rq dans FROM */
/* Le nombre maximal de livres dans chaque commande*/

SELECT MAX(nb_produit) AS "nombre maximal de livres par commande"
FROM 
(SELECT COUNT(produit.id_produit) AS nb_produit
FROM produit_commande, produit
WHERE produit.id_produit =  produit_commande.id_produit
AND 
type_produit = 'livre'
GROUP BY id_commande
) AS S;