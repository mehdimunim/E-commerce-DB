
/* Sous-requête dans le WHERE */

/*Liste des livres qui ne sont commandés par aucun client */
  
\! echo "\nLes livres qui ne sont commandés par aucun client:\n"

 SELECT titre,id_livre 
 FROM livre 
 WHERE id_livre 
 NOT IN ( SELECT id_produit
          FROM produit_commande
 );

