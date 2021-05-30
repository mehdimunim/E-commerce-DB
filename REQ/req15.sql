/* Requête portant sur 3 tables */

-- Liste des numéros des periodiques hebdomadaires :

SELECT periodique.issn, periodique.titre, numero_periodique.date_publication
	FROM numero_periodique, periodique, produit
	WHERE numero_periodique.issn=periodique.issn
		AND produit.id_produit=numero_periodique.id
		AND type_produit='periodique'
		AND periodicite='Hebdomadaire';