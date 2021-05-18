/* Script pour créer toutes les tables */
/* 
Script pour créer la table livres
*/

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
