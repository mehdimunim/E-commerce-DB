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
