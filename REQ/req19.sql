-- Les clients ayant donné des notes supérieur à 8 aux produits at ayant donné un avis

\! echo "\nLes clients ayant donné des notes supérieur à 8 aux produits\n"

SELECT prenom,nom,client.id_client,id_produit,type_produit,note,avis
FROM client NATURAL JOIN  notation
WHERE note>=8 AND avis IS NOT  NULL;
