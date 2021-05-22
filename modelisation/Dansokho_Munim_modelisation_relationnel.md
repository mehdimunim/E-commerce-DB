
# Modélisation en schéma relationnel

Les différentes tables et leurs attributs. Pour les produits, nous avons choisi de garder un id unique personnalisé, différent de l'ISBN ou du SICI, car plus court et intuitif. 

`Attribut en couleur` : clé primaire ; **texte en gras** : contraintes et remarques ; **FK** : Foreign Key (clé étrangère).

## Client

> Les clients dans la base de données.

* `id du client`

* Mail **Non nul**

* Prénom **Non nul**

* Nom **Non nul**

* Adresse **Non nul**

* numéro de téléphone **Non nul**

## Produit

 > Les produits et leurs types (livres ou périodiques).

* `Id du produit`

* Type de produit **dans "livre" U "périodique"**

## Livre

* `Id` **FK Produit(Id)**

* Titre **non nul**

* Titre original

* ISBN **non nul**

* Genre **non nul**

* Maison d'édition

* Auteur **non nul**

* Support

* Date

* Date de 1ère publication

* Langue **non nul**

* Langue d'origine **non nul**

* Pays

* Traducteur

## Periodique

> Un périodique désigne une publication qui parait à une fréquence constante. Sont par exemple des publications periodiques : un quotidien (parait tout les jours), un hebdomadaire (paraît toutes les semaines) ou un bimestriel (paraît tous les deux mois).

* `ISSN`

* Titre **non nul**

* Periodicite

* Langue

* Pays

* Ville d'édition

* Genre

* Rédacteur en chef

## Numéro d'un périodique

> Le couple (ISSN, numéro) est unique.

* `Id` **FK Produit(Id)**

* ISSN du périodique **FK Periodique(Id)**

* Numéro dans la série **=> 1**

* Date

## Produit effectif

> Le produit physique tel que stocké dans l'entrepôt

* `Id du produit` **FK Produit(Id)**

* Disponible ? **dans Oui/Non**

* Délai **0 si le produit est disponible**

* Nombre d'items **>= 0**

## Panier

* `Id panier`

* Id client **FK Client(Id du Client)**

## Produit dans le panier

> Liste des produits dans chaque panier pour chaque client.

* Id du produit **FK Produit(Id)**

* `Id panier` **FK Panier(Id)**

* Nombre d'items du produit **>= 0 ET Inférieur au nombre d'item du produit indiqué dans Produit effectif**

## Commande

> L'ensemble des commandes validées par les clients. Elles correspond donc à un panier de la base de données.

* `id commande`

* Date de commande

* Id du panier **FK Panier(Id du panier)**

* id du client **FK Commande(Id client)**

## Produit commandé

> Les différents produits dans la commande pour chaque client.

* `id du produit` **FK Produit(Id)**

* `Id commande` **FK Commande(id de commande)**

* `id du client` **FK Client(id du client)**

* Date de commande **FK Commande(date)**

* Etat effectif du produit

* Nombre d'items du produit **La somme des items pour un produit est inférieur au nombre d'items dans produit effectif**

## Commande effective

> L'état physique des commandes validées.

* `Id commande` **FK Produit commandé(id commandes)**

* Id du client **FK Commande(id client)**

* Date de commande **FK Produit commandé(date de commande)**

* Etat de la commande **dans Livré/En cours**

* adresse de livraison **non nul**

* prix de la commande

* mode payement **dans chèque/ CB/ espèces**

* effectivement payé ? **dans Oui/ Non**

## Produit retourné

> Les produits retournés par les clients.

* `id du client` **FK Produit commandé(id client)**

* `id du produit` **FK Produit commandé(id produit)**

* Date de commande **FK Produit commandé(date commande)**

* Motif

* Montant du remboursement **Inférieur au prix payé pour l'article, indiqué dans Commande**

## Historique des prix

> Les différents prix des produits au cours des jours.

* `Id du produit` **FK Produit(Id)**

* `Date`

* Prix unitaire

## Notation

> Les notations des produits par les clients. Le produit qui est noté par le client doit avoir été acheté par celui-ci

* `id du produit` **FK Produit(Id)**

* `Id du client` **FK Client(id)**

* Note **Entre 1 et 10 inclus**

* Avis **Sous forme d'un court texte**
