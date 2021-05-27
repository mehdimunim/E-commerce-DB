/* sous-rq dans FROM */
/* Le nombre maximal de livres dans chaque commande*/

SELECT MAX(nb_produit)
FROM 
(SELECT COUNT(id_produit) AS nb_produit
FROM produit_commande, produit
WHERE produit.id =  produit_commande.id
AND 
produit.genre = "livre"
GROUP BY id_commande
) AS S;