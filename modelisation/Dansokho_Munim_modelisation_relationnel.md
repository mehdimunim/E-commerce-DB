
# Modélisation en schéma relationnel

Les différentes tables et leurs attributs classé par ordre de complexité (nombre de clés étrangères)

## Clients

> Les clients dans la base de données

* `id du client`

* Mail 

* Prénom

* Nom

* Adresse

* numéro de téléphone

Aucun des attributs n'est nul.

## Livres

* Titre **non nul**

* Titre original

* `ISBN` **PK**

* Genre

* Maison d'édition

* Auteur **non nul**

* Support

* Date **non nul**

* Date de 1ère publication

* Langue **non nul**

* Langue d'origine **non nul**

* Pays

* Traducteur

### Numéros d'un périodique

* `SICI`

* `Numéro dans la série`

* Date

* Support

* Liste des contributeurs

* Titre du périodique

* ISSN du périodique

* Type du périodique

* Langue

* Sujet abordé ou spécialisation

* Public destiné

### Notations

> Les notations des produits par les clients

* `id du produit`

* `Type de produit`

* `Id du client`

* Note **Entre 0 et 10**

* Avis (sous forme d'un court texte)

Le produit qui est noté par le client doit avoir été acheté par celui-ci

### Historique des prix

> Différents prix par prix au cours des jours

* `Type de produit` **FK Périodiques(type du périodique) UNION {livre}**

* `Id du produit` **FK Livres(ISBN) UNION Periodiques(SICI)**

* `Date`

* Prix

### Produits effectifs

> Le produit physique tel que stocké dans l'entrepôt

* `Type de produit` **FK Périodiques(type du périodique) UNION {livre}**

* `Id du produit` **FK Périodiques(SICI) UNION Livres(ISBN)**

* Disponibile ? **dans Oui/Non**

* Délai **null si le produit est disponible**

* Nombre d'items **>= 0**

### Contenu des paniers

> Liste des produits dans chaque panier pour chaque client

* `Id panier` *identifiant unique pour les paniers*

* Id client **FK Clients(id_clients)**

* Id du produit **FK Périodiques(SICI) UNION Livres(ISBN)** 

* Type de produit **FK Périodiques(type) UNION {livre}**

* Nombre d'items du produit **>= 0** **Inférieur au nombre d'item du produit indiqué dans Produits effectifs**

### Commandes

> L'ensemble des commandes validées par les clients. Elles correpond donc à un panier de la base de données.

* `id commande` 

* Date de commande **FK commandes(date)**

* Id du panier **FK paniers(id du panier)**

* id du client **FK commandes(id client)**

### Contenu des commandes

> Les différents produits dans la commande pour chaque client

* `Id commande` **FK Contenu des commandes(id commandes)**

* `id du client` **FK Client(id client)**

* `id du produit` **FK Livres(ISBN) UNION Periodiques(SICI)**

* `Type de produit` **type de périodique ou livre**

* Date de commande

* Etat effectif du produit

* Nombre d'items du produit **Inférieur au nombre d'item du produit indiqué dans Produits effectifs**

### Commandes effectives

> L'état physique des commandes validées

* `Id commande` **FK Contenu des commandes(id commandes)**

* Id du client **FK commandes(id client)**

* Date de commande **FK Contenu des commandes(date de commande)**

* Etat de la commande **dans Livré/En cours**

* adresse de livraison **non nul**

* prix de la commande

* mode payement **dans chèque/ CB/ espèces**

* effectivement payé ? **dans Oui/ Non**



### Contenu commandes retournées

> Les produits retournées par les clients

* `id du client` **FK Contenu commande(id client)**

* `id du produit` **FK Contenu commande(id produit)**

* `Type de produit` 

* Date de commande **FK Contenu commande(date commande)**

* Motif

* Montant du remboursement **Inférieur au prix payé pour l'article, indiqué dans commandes validées**
