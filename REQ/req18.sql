
 /*Q18 La note moyenne donnée a chaque type de produit  */
 SELECT type_produit,AVG(note) AS "note moyenne"
 FROM notation
 GROUP BY type_produit
 ORDER BY "note moyenne";
 