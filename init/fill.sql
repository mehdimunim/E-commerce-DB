\! echo "\nREMPLISSAGE AVEC LES CSV\n"

\COPY client from 'CSV/livre.csv' WITH (FORMAT CSV, HEADER);
\COPY commande_annulee from 'CSV/commande_annulee.csv' WITH (FORMAT CSV, HEADER);
\COPY commande from 'CSV/commande.csv' WITH (FORMAT CSV, HEADER);
\COPY historique_des_prix from 'CSV/historique_des_prix.csv' WITH (FORMAT CSV, HEADER);
\COPY livre from 'CSV/livre.csv' WITH (FORMAT CSV, HEADER);
\COPY notation from 'CSV/notation.csv' WITH (FORMAT CSV, HEADER);
\COPY numero_periodique from 'CSV/numero_periodique.csv' WITH (FORMAT CSV, HEADER);
\COPY panier from 'CSV/panier.csv' WITH (FORMAT CSV, HEADER);
\COPY periodique from 'CSV/periodique.csv' WITH (FORMAT CSV, HEADER);
\COPY produit_commande from 'CSV/produit_commande.csv' WITH (FORMAT CSV, HEADER);
\COPY produit_dans_panier from 'CSV/produit_dans_panier.csv' WITH (FORMAT CSV, HEADER);
\COPY produit_effectif from 'CSV/produit_effectif.csv' WITH (FORMAT CSV, HEADER);
\COPY produit_livre from 'CSV/produit_livre.csv' WITH (FORMAT CSV, HEADER);
\COPY produit_retourne from 'CSV/produit_retourne.csv' WITH (FORMAT CSV, HEADER);
\COPY produit from 'CSV/produit.csv' WITH (FORMAT CSV, HEADER);
