
# Modélisation en schéma relationnel

Les différentes tables et leurs attributs classé par ordre de complexité (nombre de clés étrangères)

## Clients

> Les clients dans la base de données

* __id du client__

* Mail 

* Prénom

* Nom

* Adresse

* numéro de téléphone

Aucun des attributs n'est nul.

## Livres

* Titre **non nul**

* Titre original

* __ISBN__ **PK**

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

* __SICI__

* __Numéro dans la série__

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

* __id du produit__

* __Type de produit__

* __Id du client__

* Note **Entre 0 et 10**

* Avis (sous forme d'un court texte)

Le produit qui est noté par le client doit avoir été acheté par celui-ci

### Historique des prix

> Différents prix par prix au cours des jours

* __Type de produit__ **FK Périodiques(type du périodique) UNION {livre}**

* __Id du produit__ **FK Livres(ISBN) UNION Periodiques(SICI)**

* __Date__

* Prix

### Produits effectifs

> Le produit physique tel que stocké dans l'entrepôt

* __Type de produit__ **FK Périodiques(type du périodique) UNION {livre}**

* __Id du produit__ **FK Périodiques(SICI) UNION Livres(ISBN)**

* Disponibile ? **dans Oui/Non**

* Délai **null si le produit est disponible**

* Nombre d'items **>= 0**

### Contenu des paniers

> Liste des produits dans chaque panier pour chaque client

* __Id panier__ *identifiant unique pour les paniers*

* Id client **FK Clients(id_clients)**

* Id du produit **FK Périodiques(SICI) UNION Livres(ISBN)** 

* Type de produit **FK Périodiques(type) UNION {livre}**

* Nombre d'items du produit **>= 0** **Inférieur au nombre d'item du produit indiqué dans Produits effectifs**

### Commandes

> L'ensemble des commandes validées par les clients. Elles correpond donc à un panier de la base de données.

* __id commande__ 

* Date de commande **FK commandes(date)**

* Id du panier **FK paniers(id du panier)**

* id du client **FK commandes(id client)**

### Contenu des commandes

> Les différents produits dans la commande pour chaque client

* __Id commande__ **FK Contenu des commandes(id commandes)**

* __id du client__ **FK Client(id client)**

* __id du produit__ **FK Livres(ISBN) UNION Periodiques(SICI)**

* __Type de produit__ **type de périodique ou livre**

* Date de commande

* Etat effectif du produit

* Nombre d'items du produit **Inférieur au nombre d'item du produit indiqué dans Produits effectifs**

### Commandes effectives

> L'état physique des commandes validées

* __Id commande__ **FK Contenu des commandes(id commandes)**

* Id du client **FK commandes(id client)**

* Date de commande **FK Contenu des commandes(date de commande)**

* Etat de la commande **dans Livré/En cours**

* adresse de livraison **non nul**

* prix de la commande

* mode payement **dans chèque/ CB/ espèces**

* effectivement payé ? **dans Oui/ Non**



### Contenu commandes retournées

> Les produits retournées par les clients

* __id du client__ **FK Contenu commande(id client)**

* __id du produit__ **FK Contenu commande(id produit)**

* __Type de produit__ 

* Date de commande **FK Contenu commande(date commande)**

* Motif

* Montant du remboursement **Inférieur au prix payé pour l'article, indiqué dans commandes validées**
