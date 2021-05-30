

\! echo "\nLes clients ayant apprécié que les livres\n"
 SELECT prenom,nom,client.id_client,id_produit,type_produit,note,avis
 FROM notations NATURAL JOIN client
 WHERE id_client IN
            (SELECT id_client
             FROM notations
             WHERE (type_produit = 'livre'AND note>=5));