-- La note moyenne donnée a chaque type de produit :

\! echo "\nLa note moyenne donnée a chaque type de produit\n"

 SELECT type_produit,AVG(note) AS "note moyenne"
 FROM notation
 GROUP BY type_produit
 ORDER BY "note moyenne";
