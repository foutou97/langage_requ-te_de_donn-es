

USE gestion_produit;
GO

CREATE TABLE clients(
id_client INT PRIMARY KEY,
Nom_client VARCHAR(100) NOT NULL,
Tel_client VARCHAR(20) NOT NULL,
);
-- Inserer des données dans la table clients
INSERT INTO clients (id_client, Nom_client,Tel_client)
VALUES 
(1, 'Tal', 1987436271),
(2, 'Exauce', 3897364984),
(3, 'Francine', 0980097456);

CREATE TABLE produits( 
id_produit INT PRIMARY KEY,
Nom_produit VARCHAR(100)NOT NULL,
Categorie VARCHAR(50) NOT NULL,
Prix DECIMAL(10,2) NOT NULL
);
-- Inserer des données dans la table produits 
INSERT INTO produits (id_produit,Nom_produit,Categorie, Prix)
VALUES
(101, 'Widget', 'widget',10.00),
(102, 'Gadget', 'gadget',15.00),
(103, 'Doohickey', 'doohickey',5.00);

CREATE TABLE commandes (
id_commande INT PRIMARY KEY,
id_client INT NOT NULL,
id_produit INT NOT NULL,
Date_commande DATE NOT NULL,
Quantite INT NOT NULL,
Montant_total DECIMAL(10, 2),
FOREIGN KEY (id_client) REFERENCES clients(id_client),
FOREIGN KEY (id_produit) REFERENCES produits( id_produit)
);

-- Inserérer des commandes dans la table commandes

INSERT INTO commandes (id_commande,id_client, id_produit, Date_commande,Quantite, Montant_total)
VALUES 
(1001,1, 101, '2023-08-01', 1,10.00),
(1002,1, 102, '2023-08-02', 2,30.00),
(1003,1, 103, '2023-08-03', 1,5.00),
(1004,1, 101, '2023-08-04', 2,20.00),
(1005,1, 102, '2023-08-05', 1,15.00),
(1006,1, 103, '2023-08-06', 1,5.00),
(1007,1, 101, '2023-08-07', 1,10.00),
(1008,2, 101, '2023-08-01', 1,10.00),
(1009,2, 102, '2023-08-02', 1,15.00),
(1010,2, 103, '2023-08-03', 2,10.00),
(1011,2, 101, '2023-08-04', 1,10.00),
(1012,2, 102, '2023-08-05', 2,30.00),
(1013,2, 103, '2023-08-06', 1,5.00),
(1014,2, 101, '2023-08-07', 1,10.00),
(1015,3, 101, '2023-08-01', 1,10.00),
(1016,3, 102, '2023-08-02', 1,15.00),
(1017,3, 103, '2023-08-03', 2,10.00),
(1018,3, 101, '2023-08-04', 1,10.00),
(1019,3, 102, '2023-08-05', 2,30.00),
(1020,3, 103, '2023-08-06', 1,5.00),
(1021,3, 101, '2023-08-07', 1,10.00);

