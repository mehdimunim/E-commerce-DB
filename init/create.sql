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
DROP TABLE IF EXISTS historique_des_prix CASCADE;
DROP TABLE IF EXISTS produit_retourne CASCADE;
DROP TABLE IF EXISTS notation CASCADE;
DROP TYPE IF EXISTS etat_commande;

\! echo "\nCREATION DES TABLES\n"

CREATE TABLE client(
    id_client INTEGER PRIMARY KEY,
    prenom TEXT NOT NULL,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    mail TEXT NOT NULL,
    telephone VARCHAR(20) NOT NULL
	date_naissance DATE,
    date_inscription DATE
); 

CREATE TABLE produit(
    id_produit INTEGER PRIMARY KEY,
    type_produit TEXT,
	delai_retour INTEGER
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
    traducteur TEXT,
    FOREIGN KEY(id_livre) REFERENCES produit(id_produit)
);

CREATE TABLE periodique(
    issn VARCHAR(10) PRIMARY KEY,
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
    issn VARCHAR(10) REFERENCES periodique(issn),
    num INTEGER,
    date_publication TEXT,
    CHECK (num >= 1),
    FOREIGN KEY(id) REFERENCES produit(id_produit)
);

CREATE TABLE produit_effectif(
    id INTEGER PRIMARY KEY,
    disponibilite VARCHAR(4),
    delai INTEGER,
    num INTEGER,
    CHECK (num >= 0),
    FOREIGN KEY(id) REFERENCES produit(id_produit)
);

CREATE TABLE panier(
    id_panier INTEGER PRIMARY KEY,
    id_client INTEGER REFERENCES client(id_client)
);

CREATE TABLE produit_dans_panier(
    id_prod INTEGER REFERENCES produit(id_produit),
    id_panier INTEGER REFERENCES panier(id_panier),
    quantite INTEGER,
    PRIMARY KEY (id_prod, id_panier),
    CHECK (quantite >=0)
);

CREATE TYPE etat_commande AS ENUM ('en_attente','en_preparation', 'en_livraison','livree','annulee');
CREATE TABLE commande( 
    id_commande INTEGER PRIMARY KEY,
    date_commande VARCHAR(10),
	id_prod INTEGER REFERENCES produit(id_produit),
    id_panier INTEGER REFERENCES panier(id_panier),
    adresse_livraison TEXT NOT NULL,
    prix_commande NUMERIC,
    mode_payement TEXT,
    effectivement_paye BOOLEAN,
	etat etat_commande,
	date_expedition VARCHAR(10)
);

CREATE TABLE commande_annulee(
    id_commande INTEGER PRIMARY KEY,
    date_annulation VARCHAR(10),
	remboursement BOOLEAN,
    FOREIGN KEY(id_commande) REFERENCES commande(id_commande)
);

CREATE TABLE produit_commande(
    id_commande INTEGER REFERENCES commande(id_commande),
    id_produit INTEGER REFERENCES produit(id_produit),
    quantite INTEGER,
    PRIMARY KEY (id_produit, id_commande)
);

CREATE TABLE produit_livre(
    id_produit INTEGER REFERENCES produit(id_produit),
    id_commande INTEGER REFERENCES commande(id_commande),
    date_livraison_effective VARCHAR(10),
    quantite_livree INTEGER,
    PRIMARY KEY (id_produit, id_commande, date_livraison_effective)
);
/*Peut-on mettre une FK avec produit commande ou commande(date commande) ?*/
CREATE TABLE produit_retourne( 
    id_client INTEGER REFERENCES client(id_client),
    id_produit INTEGER REFERENCES produit(id_produit),
    date_commande VARCHAR(10),
    motif TEXT,
    montant NUMERIC,
    PRIMARY KEY (id_client, id_produit)
);

CREATE TABLE historique_des_prix(
    id_prod INTEGER REFERENCES produit(id_produit),
    date_prix VARCHAR(10),
    prix_unitaire NUMERIC NOT NULL,
    PRIMARY KEY (id_prod, date_prix)
);

/* Modifier les contraintes FK en accord avec la modélisation*/

CREATE TABLE notation(
    id_produit INTEGER REFERENCES produit(id_produit),
    type_produit VARCHAR(20),
    id_client INTEGER REFERENCES client(id_client),
    note INTEGER,
    avis TEXT,
    PRIMARY KEY (id_produit, id_client),
    CHECK (note BETWEEN 0 AND 10)
);
