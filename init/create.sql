/* Script pour créer toutes les tables */

DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS livre CASCADE;
DROP TABLE IF EXISTS produit CASCADE; 
DROP TABLE IF EXISTS periodique CASCADE;
DROP TABLE IF EXISTS numero_periodique CASCADE;
DROP TABLE IF EXISTS produit_effectif CASCADE;
DROP TABLE IF EXISTS panier CASCADE;
DROP TABLE IF EXISTS produit_dans_panier CASCADE; 
DROP TABLE IF EXISTS commande CASCADE;
DROP TABLE IF EXISTS commande_annulee CASCADE;
DROP TABLE IF EXISTS produit_commande CASCADE;
DROP TABLE IF EXISTS produit_livre CASCADE;
DROP TABLE IF EXISTS historique_prix CASCADE;
DROP TABLE IF EXISTS produit_retourne CASCADE;
DROP TABLE IF EXISTS notation CASCADE;


CREATE TABLE client(
    id_client INTEGER PRIMARY KEY,
    mail TEXT NOT NULL,
    prenom TEXT NOT NULL,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    telephone NUMERIC NOT NULL
); 

CREATE TABLE produit(
    id_produit INTEGER PRIMARY KEY,
    type_produit TEXT
);


CREATE TABLE livre (
    id_livre INTEGER PRIMARY KEY,
    titre TEXT NOT NULL,
    titre_original TEXT,
    isbn13 NUMERIC NOT NULL,
    genre TEXT NOT NULL,
    maison_edition TEXT,
    auteur TEXT NOT NULL,
    date_edition INTEGER,
    date_publication INTEGER,
    support TEXT NOT NULL,
    langue TEXT NOT NULL,
    langue_origine TEXT NOT NULL,
    pays TEXT NOT NULL,
    traducteur TEXT
);

CREATE TABLE periodique(
    issn NUMERIC PRIMARY KEY,
    titre TEXT NOT NULL,
    periodicite VARCHAR(50),
    langue TEXT,
    pays TEXT,
    Ville_edition TEXT,
    genre TEXT,
    redacteur_en_chef TEXT
);

CREATE TABLE numero_periodique(
    id INTEGER PRIMARY KEY,
    issn INTEGER REFERENCES periodique(issn),
    num INTEGER,
    date_publication TEXT,
    CHECK (num >= 1)
);

CREATE TABLE produit_effectif(
    id INTEGER PRIMARY KEY,
    disponibilite VARCHAR(4),
    delai INTEGER,
    num INTEGER,
    CHECK (num >= 0)
);

CREATE TABLE panier(
    id_panier INTEGER PRIMARY KEY,
    id_client INTEGER REFERENCES client(id_client)
);

CREATE TABLE produit_dans_panier(
    id_prod INTEGER PRIMARY KEY,
    id_panier INTEGER,
    quantite INTEGER,
    CHECK (quantite >=0)
);

CREATE TABLE commande( 
    id_commande INTEGER PRIMARY KEY,
    date_commande INTEGER,
    id_panier INTEGER,
    id_client INTEGER,
    adresse_livraison TEXT NOT NULL,
    prix_commande INTEGER,
    mode_payement TEXT,
    effectivement_paye VARCHAR(3)
);

CREATE TABLE commande_annulee(
    id_commande INTEGER PRIMARY KEY,
    date_annulation INTEGER
);

CREATE TABLE produit_commande(
    id_produit INTEGER PRIMARY KEY,
    id_commande INTEGER,
    quantite INTEGER
);

CREATE TABLE produit_livre(
    id_produit INTEGER PRIMARY KEY,
    id_commande INTEGER,
    date_livraison_effective INTEGER,
    quantite_livree INTEGER

);

CREATE TABLE produit_retourne( 
    id_client INTEGER PRIMARY KEY,
    id_produit INTEGER,
    date_commande INTEGER,
    motif TEXT,
    montant NUMERIC
);

CREATE TABLE historique_prix(
    id_prod INTEGER PRIMARY KEY REFERENCES produit(id_produit),
    date_prix INTEGER NOT NULL,
    prix_unitaire NUMERIC NOT NULL
);

CREATE TABLE notation(
    id_produit INTEGER PRIMARY KEY,
    id_client INTEGER,
    note INTEGER,
    avis VARCHAR(50),
    FOREIGN KEY(id_produit) REFERENCES produit(id_produit),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    CHECK (note BETWEEN 1 AND 10)
);