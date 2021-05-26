/* Script pour remplir les tables grâce au CSV*/

/* Remplit la table livres*/

COPY livre
FROM '/home/mehdi/E-commerce-DB-1/CSV/livres.csv'
DELIMITER ',' CSV HEADER;

