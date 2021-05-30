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
