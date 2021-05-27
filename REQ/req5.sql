/* sous-rq dans WHERE */
/* Les clients qui ont acheté des livres traduits */

SELECT nom, prenom
FROM client 
WHERE 
client.id IN  
(   
    /* client ayant commandé des livres traduits */
    SELECT commande.id_client
    FROM commande, produit_commande
    WHERE commande.id_commande = produit_commande.id_commande
    AND 
    produit_commande.id IN
    /* livre traduits */
    (   SELECT livre.id
        FROM livre
        WHERE livre.Traducteur IS NOT NULL  
        ):

);