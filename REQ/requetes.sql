-- Liste des numéros des periodiques hebdomadaires
SELECT periodique.issn, periodique.titre, numero_periodique.date_publication
	FROM numero_periodique, periodique, produit
	WHERE numero_periodique.issn=periodique.issn
		AND produit.id_produit=numero_periodique.id
		AND type_produit='periodique'
		AND periodicite='Hebdomadaire';

-- Commandes annulées
SELECT * FROM commande_annulee
	INNER JOIN commande ON commande.id_commande=commande_annulee.id_commande;

-- TOP 5 des livres les plus commandés
SELECT produit.id_produit, livre.titre, sum(produit_livre.quantite_livree) as total_vente
	FROM produit_livre
	INNER JOIN produit ON produit_livre.id_produit=produit.id_produit
	INNER JOIN livre ON produit.id_produit=livre.id_livre
	GROUP BY produit.id_produit, livre.titre
	HAVING produit.type_produit='livre'
	ORDER BY total_vente DESC
	LIMIT 5;

-- TOP 5 des livres avec le plus de désistement
SELECT produit_commande.id_produit, livre.titre, sum(produit_commande.quantite) as nb_annulation FROM commande_annulee
	INNER JOIN commande ON commande.id_commande=commande_annulee.id_commande
	INNER JOIN produit_commande ON produit_commande.id_commande=commande.id_commande
	INNER JOIN produit ON produit_commande.id_produit=produit.id_produit
	INNER JOIN livre ON produit.id_produit=livre.id_livre
	GROUP BY produit_commande.id_produit, livre.titre, produit.type_produit
	HAVING produit.type_produit='livre'
	ORDER BY nb_annulation DESC
	LIMIT 5;
	
-- Envoyer un email de PUB aux clients qui n'ont jamais fait de commande
SELECT client.id_client, nom, prenom, mail FROM client 
    LEFT JOIN commande ON client.id_client = commande.id_client 
    WHERE commande.id_client is NULL;

