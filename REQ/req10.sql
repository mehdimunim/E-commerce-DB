
 /*Q10 liste des livres qui ne sont commandé par aucun client */
  
\! echo "\nliste des livres qui ne sont commandés par aucun client:\n"

 SELECT titre,id_livre 
 FROM livre 
 WHERE id_livre 
 NOT IN ( SELECT id_produit
          FROM produit_commande
 );