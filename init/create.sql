/* Script pour créer toutes les tables */
/* 
Script pour créer la table livres
*/

/*
Script pour creer la table client
*/
CREATE TABLE client(
    Id_client INTEGER PRIMARY KEY,
    mail TEXT NOT NULL,
    prenom TEXT NOT NULL,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    'numero telephone' NUMERIC NOT NULL,

) 
CREATE TABLE livres (
    Id INTEGER PRIMARY KEY,
    Titre TEXT NOT NULL,
    "Titre original" TEXT,
    ISBN13 NUMERIC NOT NULL,
    Genre TEXT NOT NULL,
    "Maison d'édition" TEXT,
    Auteur TEXT NOT NULL,
    Date INTEGER,
    "Date 1er publication" INTEGER,
    Support TEXT NOT NULL,
    Langue TEXT NOT NULL,
    "Langue d'origine" TEXT NOT NULL,
    Pays TEXT NOT NULL,
    Traducteur TEXT
);


/*
Script pour creer la table panier
*/


/*
Script pour creer la table periodique
*/
CREATE TABLE perdiodique(
    Id INTEGER,
    'numero de la série' NUMERIC NOT NULL,
    support TEXT,
    'liste_contributeurs' TEXT,
    titre TEXT NOT NULL,
    issn NUMERIC,
    type_periodique TEXT,
    langue TEXT,
    'sujet abordé/specialisation' TEXT,
    'public destiné' TEXT,

)


/*
Script pour creer la table notation
*/

CREATE TABLE notations(
    FOREIGN KEY ( 'Id produi') REFERENCES periodique (Id) UNION livres(Id),
    FOREIGN KEY(Id_client) REFERENCES client(Id_client),
    note INTEGER,
    CHECK(note BETWEEN 0 AND 10),
    avis VARCHAR(30) TEXT,

)


/*
Script pour creer la table historique des prix
*/

CREATE TABLE historique_prix(
    FOREIGN KEY (Id_prod) REFERENCES livres(Id) UNION perdiodique(Id),
    'date' DATE NOT NULL,
    'prix unitaire' NUMERIC NOT NULL,
)


/*
Script pour creer la table produit effectif
*/

CREATE TABLE produit effectif (
   FOREIGN KEY(Id_prod) REFERENCES perdiodique(Id) UNION livres(Id),
   'disponible ?' BOOLEAN NOT NULL,
    delai NUMERIC,  /* contrainte à ajouter*/
    'nombre items' NUMERIC,
    CHECK ( 'nombre items'>=0),

)

/*
Script pour creer la table panier
*/
CREATE TABLE paniers(
    Id_panier INTEGER PRIMARY KEY,
    FOREIGN KEY(Id client) REFERENCES client (Id) du client),
    FOREIGN KEY( Id_prod) REFERENCES periodique(Id) UNION livres(Id),
    'nombre items du produit'  NUMERIC,  /* doit être positif et inferieur au nombre d'items du produit indiqué*/

)

  /*
  script pour creer la table commandes
  */

  CREATE TABLE commandes(
      Id_commande INTEGER PRIMARY KEY,
       FOREIGN KEY('date de commande') REFERENCES historique_prix('date'),
       FOREIGN KEY(Id_panier) REFERENCES paniers( Id_panier),
       FOREIGN KEY(Id_client) REFERENCES client(Id_client), /* la table référencée me semble être client plutot que commandes comme tu l'as fait dans la modelisation*/
  )

  /*
  script pour creer la table contenu commande
  */

CREATE TABLE contenu commandes(
    FOREIGN KEY(Id_commande) REFERENCES commandes( Id_commande),
    FOREIGN KEY(Id_client) REFERENCES client(Id_client),
    FOREIGN KEY( Id_prod) REFERENCES periodique(Id) UNION livres(Id),
    FOREIGN KEY('date de commande') REFERENCES commande('date de commande'),
    'etat effectif produit' VARCHAR(10) TEXT NOT NULL,
    'nombre_items_produit' NUMERIC NOT NULL, /*doit être inférieur à celui dans produit effectif*/
)

 /*
  script pour creer la table commandes effectives
  */
CREATE TABLE commandes effectives(
    FOREIGN KEY(Id_commande) REFERENCES commandes( Id_commande),
    FOREIGN KEY(Id_client) REFERENCES client(Id_client),
    FOREIGN KEY( Id_prod) REFERENCES periodique(Id) UNION livres(Id),
    FOREIGN KEY('date de commande') REFERENCES commande('date de commande'),
    'etat de la commande' VARCHAR(10) TEXT NOT NULL,
    adresse TEXT NOT NULL, 
    'prix de la commande' NUMERIC NOT NULL,
    'mode de paiement' TEXT  NOT NULL,
    'effective payé?' BOOLEAN,
)

/*
  script pour creer la table contenu commandes retournées
  */

CREATE TABLE contenu commandes retournées(
    FOREIGN KEY(Id_commande) REFERENCES commandes( Id_commande),
    FOREIGN KEY(Id_client) REFERENCES client(Id_client),
    FOREIGN KEY( Id_prod) REFERENCES periodique(Id) UNION livres(Id),
    FOREIGN KEY('date de commande') REFERENCES commande('date de commande'),
    motif VARCHAR(30) TEXT NOT NULL,
    'montant du remboursement' NUMERIC NOT NULL, /*doit être inférieur aux prix payé pour l'article dans commandes effective*/
)


   


