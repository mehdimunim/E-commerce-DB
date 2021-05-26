# Base de données pour site de e-commerce

 > Projet de Base Donnée : modéliser, créer un site de commerce, pour y faire des requêtes SQL

## Table des matières

* [Equipe](#equipe)
* [Description](#description)
* [Fonctionnalités](#fonctionnalités)
* [Utilisation](#utilisation)
* [Exemples](#exemples)
* [Technologies utilisées](#technologies)
* [Sources](#sources)
* [License](#license)

## Equipe

Mamadou DANSOKHO 21964189

Mehdi MUNIM 21964021

Lauréna PORCEL (?) [num étudiant]

## Description

Dans ce projet, on modélise un site de e-commerce. 

Nous avons choisi de nous focaliser sur la vente de livres et périodiques. 

Les prix peuvent évoluer au cours du temps, c'est pour cela qu'on en garde une trace.

Nos clients entrent des informations personnelles dans le système. Il peuvent commander plusieurs produits, pourvus qu'ils soient disponibles. 

Un client peut annuler sa commande et être remboursé ; il peut aussi être dédommagé si le produit ne lui convient pas.

Enfin, nos clients peuvent attribuer une note aux produits achetés.

## Fonctionnalités

* Créé les tables correspondant à une modélisation
* Remplit les tables grâce aux fichiers CSV
* Peut effectuer des requêtes fixées à l'avance.

## Utilisation

> Comment initialiser la BD ?

1. Lancer le fichier `init/create.sql` 
2. Lancer `init/fill.sql`
3. Effectuer les requêtes voulues grâce à `REQ/reqX.sql` ou X va de 1 à 20. 

Alternativement lancer le fichier `run.sh` puis faire les [requêtes](#REQ) désirées .

## Contenu

### run.sh

Initialise les tables et lance la requête 1.

### CSV

Contenu des tables en format CSV. Les sources sont indiquées [ici](#sources).

## init

Commandes SQL pour initialiser les tables

## modelisation

Notre modélisation Entité-Relation et en schéma relationel pour la base de données

### REQ

Requêtes SQL

1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.
16.
17.
18.
19.
20.

## Exemples

## Technologies

* postgresql

## Sources

* Pour la table livre.csv : données remplies à l'aide du site GoodReads.
* Pour la table client.csv : données générées à 10 reprises avec [generatedata](http://www.generatedata.com/) puis légèrement modifiées.
* Pour la table numero_periodique.csv : [Gallica](https://gallica.bnf.fr/) et [archive.org](https://archive.org/)


## License 

MIT License 

Copyright c - Mehdi MUNIM, Mamadou DANSOKHO, Lauréna PORCEL
