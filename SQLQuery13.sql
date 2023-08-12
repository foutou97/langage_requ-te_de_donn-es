USE gestion_produit;
Go 
-- R�cup�rer les noms des clients qui ont command� aumoins un widget et au moins un gadget, ainsi que le cout total des widgets et gadgets command�s par chaque client

SELECT DISTINCT clients.Nom_client,
	SUM(produits_widget.prix * commandes_widget.Quantite) AS Montant_total_widgets,

	SUM(produits_gadget.prix * commandes_gadget.Quantite) AS Montant_total_gadgets

FROM clients

JOIN commandes AS Commandes_widget
	
	ON clients.id_client = Commandes_widget.id_client

JOIN produits AS produits_widget

	ON Commandes_widget.id_produit = produits_widget.id_produit AND produits_widget.Categorie = 'widget'

JOIN commandes AS  commandes_gadget 

	ON clients.id_client = commandes_gadget.id_client

JOIN produits AS produits_gadget

	ON commandes_gadget.id_produit = produits_gadget.id_produit AND produits_gadget.Categorie = 'gadget'

GROUP BY clients.id_client, clients.Nom_client;

-- R�cup�rer les noms des clients qui ont command� aumoins un widget ainsi que le cout total des widgets command�s par chaque client

SELECT clients.Nom_client,
	
	SUM (produits.Prix * commandes.Quantite) AS Montant_total

FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

JOIN produits ON commandes.id_produit = produits.id_produit AND produits.Categorie = 'widget'

GROUP BY clients.id_client ,clients.Nom_client;

-- R�cup�rer les noms des clients qui ont pass� commande pour au moins un gadget, ainsi que le cout total des gadgets command�s par chaque client
  

  SELECT clients.Nom_client,
	
	SUM (produits.Prix * commandes.Quantite) AS Montant_total

FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

JOIN produits ON commandes.id_produit = produits.id_produit AND produits.Categorie = 'gadget'

GROUP BY clients.id_client ,clients.Nom_client;

-- R�cup�rer les noms des clients qui ont pass� commande pour au moins un doohickeys, ainsi que le cout total des doohickeys command�s par chaque client

 SELECT clients.Nom_client,
	
	SUM (produits.Prix * commandes.Quantite) AS Montant_total

FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

JOIN produits ON commandes.id_produit = produits.id_produit AND produits.Categorie = 'doohickey'

GROUP BY clients.id_client ,clients.Nom_client;

-- R�cup�rer le nombre total de widgets et de gadgets command�s par chaque client, ainsi que le cout total des commandes

SELECT clients.Nom_client,

	SUM (CASE WHEN produits.Categorie = 'widget' OR produits.Categorie = 'gadget' THEN Quantite ELSE 0 END) AS Quantie_total,
	
	SUM (produits.Prix * commandes.Quantite) AS Montant_total

FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

JOIN produits ON commandes.id_produit = produits.id_produit

GROUP BY clients.id_client ,clients.Nom_client;

-- R�cuperer les noms des produits qui ont �t� command�s par au moins un client, ainsi que la quantit� totale de chaque produit command�.

SELECT produits.Nom_produit,
	
	SUM (Quantite) AS Quantite_totale 

FROM produits

JOIN commandes ON produits.id_produit = commandes.id_produit

GROUP BY produits.Nom_produit;

-- R�cup�rer les Noms des clients qui ont pass� le plus de commandes , ainsi que le nombre total de commandes pass�es par chaque client.

SELECT clients.Nom_client,

	COUNT(commandes.id_commande) AS Nombre_de_commandes

FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

GROUP BY clients.Nom_client

ORDER BY Nombre_de_commandes DESC;

-- R�cup�rer les Noms des prodduits  les plus de commandes , ainsi que la quantit� total de chaque produi command�.


SELECT produits.Nom_produit,

	COUNT(Quantite) AS Quantite_totale

FROM produits

JOIN commandes ON produits.id_produit = commandes.id_produit

GROUP BY produits.Nom_produit

ORDER BY Quantite_totale DESC;

-- R�cup�rer les Noms des clients qui ont pass� une commande chaque jour de la semaine, ainsi que le nombre total de commandes pass�es par chaque client 

SELECT clients.Nom_client,
	
	COUNT (DISTINCT CONVERT(DATE, commandes.Date_commande)) AS Nombre_total_commandes
	
FROM clients

JOIN commandes ON clients.id_client = commandes.id_client

GROUP BY clients.Nom_client

HAVING COUNT(DISTINCT CONVERT(DATE, commandes.Date_commande)) = 7;