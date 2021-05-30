/* Concaténation de toutes les requêtes*/


/* 1. Requêtes sur trois tables */

-- Les clients qui ont commandé "Le Rouge et le Noir" :

\! echo "\nLes clients qui ont commandé \"Le Rouge et le Noir\"\n"
SELECT prenom, nom, client.id_client, mail
FROM client, livre, commande, produit_commande
WHERE  
produit_commande.id_commande = commande.id_commande
AND
commande.id_client = client.id_client
AND
produit_commande.id_produit = livre.id_livre
AND
titre = 'Le Rouge et le Noir'
;

-- Liste des numéros des periodiques hebdomadaires :

\! echo "\nListe des numéros des periodiques hebdomadaires\n"
SELECT periodique.issn, periodique.titre, numero_periodique.date_publication
	FROM numero_periodique, periodique, produit
	WHERE numero_periodique.issn=periodique.issn
		AND produit.id_produit=numero_periodique.id
		AND type_produit='periodique'
		AND periodicite='Hebdomadaire';


/* 2. Auto-jointure */

-- les titres français des livres qui existent à la fois en version original et traduite dans la base de données :

\! echo "\nLes titres qui existent en original et traduction\n"
(
SELECT l1.titre, l2.auteur
FROM livre AS l1, livre AS l2
WHERE l1.titre = l2.titre_original
AND l1.langue = 'Français'
)
UNION 
( 
SELECT l2.titre, l2.auteur
FROM livre AS l1, livre AS l2
WHERE l1.titre = l2.titre_original
AND l1.langue != 'Français'
)
;

/* 3. Sous-requête corrélée */

-- Les livres que tous les clients ont détesté :

\! echo "\nLes titres detestés par tous les clients\n"
SELECT titre, auteur
FROM livre 
WHERE id_livre
IN (
/* Les identifiants de ces produits*/
SELECT N.id_produit
FROM notation N 
WHERE 
NOT EXISTS
 (   SELECT id_client
    FROM notation N2
    WHERE N.id_produit = N2.id_produit
    AND
    N2.note >= 5)
)
;

/* 4. Sous-requête dans le FROM */

-- Le nombre moyen de livres par commande :

\! echo "\nNombre moyen de livres par commande\n"
SELECT ROUND(AVG(nb_produit), 1) AS "moyenne"
FROM 
(SELECT COUNT(produit.id_produit) AS nb_produit
FROM produit_commande, produit
WHERE produit.id_produit =  produit_commande.id_produit
AND 
type_produit = 'livre'
GROUP BY id_commande
) AS S;

/* 5. Sous-requête dans le WHERE */

-- Les clients qui lisent Jane Austen en VO :

\! echo "\nLes clients qui lisent Jane Austen en VO\n"
SELECT nom, prenom
FROM client 
WHERE 
client.id_client IN  
(   
    /* clients ayant commandé des livres de Jane Austenen VO */
    SELECT C.id_client 
    FROM commande C, produit_commande P
    WHERE C.id_commande = P.id_commande
    AND 
    EXISTS
    /* id des livre traduits */
    (   SELECT livre.id_livre
        FROM livre
        WHERE P.id_produit = livre.id_livre
        AND langue = 'Anglais'
        AND auteur = 'Jane Austen' 
        )
);

-- Liste des livres qui ne sont commandés par aucun client :

\! echo "\nLes livres qui ne sont commandés par aucun client:\n"
 SELECT titre,id_livre 
 FROM livre 
 WHERE id_livre 
 NOT IN ( SELECT id_produit
          FROM produit_commande
 );


/* 6. Requêtes avec agrégat*/

-- Les genres de livre les mieux vendus parmi ceux avec plus de 10 ventes au total :

\! echo "\nles genres de livre les mieux vendus parmi ceux avec plus de 10 ventes au total\n"
SELECT  S1.genre, ROUND(S1.count1/(1.0*S2.count2),1) AS "nombre de ventes par livre", S1.count1 AS "nombre de ventes"
FROM
-- nombre de ventes par genre
(SELECT genre, COUNT(genre) as count1
FROM produit_commande PC, livre
WHERE PC.id_produit = livre.id_livre
GROUP BY genre
-- au moins 10 ventes au total
HAVING COUNT(genre) > 10
ORDER BY count1
DESC
) AS S1
-- nombre de livres par genre
NATURAL JOIN
(SELECT genre, COUNT(genre) as count2
FROM livre
GROUP BY genre
ORDER BY count2
DESC
) AS S2
ORDER BY "nombre de ventes par livre"
DESC
;

-- Le nombre de livres traduits en français par langue d'origine :

\! echo "\nLe nombre de livres traduits en français par langue d'origine\n"
SELECT langue_origine, COUNT(langue_origine) nombre_traductions_fr
FROM livre
GROUP BY langue_origine, langue
HAVING langue = 'Français' 
AND langue_origine != 'Français'
ORDER BY nombre_traductions_fr
DESC
;

-- Les clients ayant commandé plus de 120 euros :

\! echo "\nles clients ayant commandé plus de 120 euros:\n"
 SELECT prenom, nom, SUM(prix_commande) AS "prix_total"
 FROM client NATURAL JOIN commande
 GROUP BY id_client
 HAVING SUM(prix_commande)>120
 ORDER BY prix_total;


/* 7. Requête impliquant le calcul de deux agrégats*/

-- La moyenne entre genres des dates maximales de publication :

\! echo "\nLa moyenne entre genres des dates maximales de publication\n"
SELECT ROUND(AVG(S.max)) AS "moyenne des maximums"
FROM  
-- les date maximale de publication pour chaque genre
( 
    SELECT genre, MAX(date_publication) max
    FROM livre
    GROUP BY genre
) AS S
;

/* 8.1 Requête avec condition de totalité (sous requête corrélée)*/

-- Les clients qui ont acheté tous les livres de Stendhal disponibles :

\! echo "\nLes clients qui ont acheté tous les livres de Stendhal disponibles 1\n"
SELECT C.prenom, C.nom, C.id_client
FROM client C
WHERE
-- Il n'y a pas de livre de Stendhal qui ne se trouve pas dans les produits commandés du client
NOT EXISTS 
-- livres écrits par Stendhal
(SELECT DISTINCT l1.titre
FROM livre l1
WHERE l1.auteur = 'Stendhal'
AND l1.id_livre
NOT IN
-- produits commandés par le client
(
SELECT id_produit 
FROM produit_commande pc1
NATURAL JOIN commande c1
WHERE c1.id_client = C.id_client
)
)
;

/* 8.2 Requête avec condition de totalité (agrégation)*/

-- Les clients qui ont acheté tous les livres de Stendhal disponibles :

\! echo "\nLes clients qui ont acheté tous les livres de Stendhal disponibles 2\n"
SELECT id_client
FROM produit_commande pc
JOIN commande c
ON  pc.id_commande = c.id_commande
JOIN livre l
ON 
pc.id_produit = l.id_livre
WHERE auteur = 'Stendhal'
GROUP BY id_client 
HAVING COUNT(DISTINCT titre)
= 
(SELECT COUNT(DISTINCT titre)
FROM livre
WHERE auteur = 'Stendhal'
)
;


/* 9. Requête avec jointure externe (LEFT JOIN)*/

-- Envoyer un email de PUB aux clients qui n'ont jamais fait de commande :

\! echo "\nLes clients n'ayant jamais effectué de commande\n"
SELECT client.id_client, nom, prenom, mail FROM client 
    LEFT JOIN commande ON client.id_client = commande.id_client 
    WHERE commande.id_client is NULL;


/* 10. Requêtes avec des NULL */

-- Nombre de livres traduits :
\! echo "\nLe nombre de livres traduits (requêtes avec NULL)\n"
SELECT COUNT(*) FROM livre;
SELECT COUNT(titre_original) FROM livre;

SELECT COUNT(*) FROM livre WHERE titre_original IS NOT NULL;




/* Requêtes en plus */

-- TOP 5 des livres les plus commandés :

\! echo "\nTOP 5 des livres les plus commandés\n"
SELECT produit.id_produit, livre.titre, sum(produit_livre.quantite_livree) as total_vente
	FROM produit_livre
	INNER JOIN produit ON produit_livre.id_produit=produit.id_produit
	INNER JOIN livre ON produit.id_produit=livre.id_livre
	GROUP BY produit.id_produit, livre.titre
	HAVING produit.type_produit='livre'
	ORDER BY total_vente DESC
	LIMIT 5;

-- TOP 5 des livres avec le plus de désistement :

\! echo "\nTOP 5 des livres avec le plus de désistement\n"
SELECT produit_commande.id_produit, livre.titre, sum(produit_commande.quantite) as nb_annulation FROM commande_annulee
	INNER JOIN commande ON commande.id_commande=commande_annulee.id_commande
	INNER JOIN produit_commande ON produit_commande.id_commande=commande.id_commande
	INNER JOIN produit ON produit_commande.id_produit=produit.id_produit
	INNER JOIN livre ON produit.id_produit=livre.id_livre
	GROUP BY produit_commande.id_produit, livre.titre, produit.type_produit
	HAVING produit.type_produit='livre'
	ORDER BY nb_annulation DESC
	LIMIT 5;

-- Le nombre total de commandes pour chaque type de produit :.

\! echo "\nle nombre total de commandes pour chaque type de produit:\n"
SELECT type_produit AS "type", SUM(quantite) AS total
FROM produit_commande NATURAL JOIN produit
GROUP BY "type";

-- Les clients ayant donné des notes supérieur à 8 aux produits at ayant donné un avis :

\! echo "\nLes clients ayant donné des notes supérieur à 8 aux produits\n"
SELECT prenom,nom,client.id_client,id_produit,type_produit,note,avis
FROM client NATURAL JOIN  notation
WHERE note>=8 AND avis IS NOT  NULL;

-- Les clients n'ayant apprécié que les livres :

\! echo "\nLes clients ayant apprécié que les livres\n"
 SELECT prenom,nom,client.id_client,id_produit,type_produit,note,avis
 FROM notation NATURAL JOIN client
 WHERE id_client IN
            (SELECT id_client
             FROM notation
             WHERE (type_produit = 'livre'AND note>5));


-- La note moyenne donnée a chaque type de produit :

\! echo "\nLa note moyenne donnée a chaque type de produit\n"
 SELECT type_produit,AVG(note) AS "note moyenne"
 FROM notation
 GROUP BY type_produit
 ORDER BY "note moyenne";
