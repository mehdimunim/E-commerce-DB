/* Script pour remplir les tables grâce au CSV*/

/* Remplit la table livres*/

COPY livres
FROM '/home/mehdi/E-commerce-DB-1/CSV/livres.csv'
DELIMITER ',' CSV HEADER;

