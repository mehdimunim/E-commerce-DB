/* Script pour remplir les tables grâce au CSV*/

\! echo "\nREMPLISSAGE AVEC LES CSV\n"

\! echo "\nclient"
\COPY client from 'CSV/client.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit"
\COPY produit from 'CSV/produit.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nlivre"
\COPY livre from 'CSV/livre.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nperiodique"
\COPY periodique from 'CSV/periodique.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nnumero_periodique"
\COPY numero_periodique from 'CSV/numero_periodique.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nhistorique_des_prix"
\COPY historique_des_prix from 'CSV/historique_des_prix.csv' WITH (FORMAT CSV, HEADER);

\! echo "\npanier"
\COPY panier from 'CSV/panier.csv' WITH (FORMAT CSV, HEADER);

\! echo "\ncommande"
\COPY commande from 'CSV/commande.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit_commande"
\COPY produit_commande from 'CSV/produit_commande.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit_dans_panier"
\COPY produit_dans_panier from 'CSV/produit_dans_panier.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit_effectif"
\COPY produit_effectif from 'CSV/produit_effectif.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit_livre"
\COPY produit_livre from 'CSV/produit_livre.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nproduit_retourne"
\COPY produit_retourne from 'CSV/produit_retourne.csv' WITH (FORMAT CSV, HEADER);

\! echo "\ncommande_annulee"
\COPY commande_annulee from 'CSV/commande_annulee.csv' WITH (FORMAT CSV, HEADER);

\! echo "\nnotation"
\COPY notation from 'CSV/notation.csv' WITH (FORMAT CSV, HEADER);
