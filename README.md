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

Lauréna PORCEL 21969892

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

1. Les clients ayant commandé "Le Rouge et le Noir"
2. Liste des numéros des périodiques hebdomadaires
3. Les titres qui existent en original et traduction
4. Les livres détestés par tous les clients
5. Le nombre moyen de livres par commande
6. Les clients qui lisent Jane Austen en VO
7. Les livres qui ne sont commandés par aucun client
8. Les genres de livre les mieux vendus parmi ceux avec plus de 10 ventes au total
9. Le nombre de livres traduits en français par langue d'origine
10. Les clients ayant commandé plus de 120 euros
11. La moyenne entre genres des dates maximales de publication
12. Les clients ayant acheté tous les livres de Stendhal disponibles (manière 1)
13. Les clients ayant acheté tous les livres de Stendhal disponibles (manière 2)
14. Les clients qui n'ont jamais effectué de commandes
15. Le nombre de livres traduits
16. TOP 5 des livres les plus commandés
17. TOP 5 des livres avec le plus de désistement
18. Le nombre total de commandes pour chaque type de produit
19. Les clients ayant donné des notes supérieur à 8 aux produits et ayant donné un avis
20. Les clients n'ayant apprécié que les livres
21. La note moyenne donnée à chaque type de produit

## Exemples

## Technologies

* postgresql

## Sources

* Pour la table livre.csv : données remplies à l'aide du site GoodReads.
* Pour la table notation: génération des données avec [online test data generator] (http://www.onlinedatagenerator.com/) puis compplétée à la main.
* Pour la table client.csv : données générées à 10 reprises avec [generatedata](http://www.generatedata.com/) puis légèrement modifiées.
* Pour la table numero_periodique.csv : [Gallica](https://gallica.bnf.fr/) et [archive.org](https://archive.org/)


## License 

MIT License 

Copyright c - Mehdi MUNIM, Mamadou DANSOKHO, Lauréna PORCEL
