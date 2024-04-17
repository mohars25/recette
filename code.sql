-- la table


CREATE TABLE Ingredient(
   id_ingredient INT AUTO_INCREMENT,
   nom_ingredient VARCHAR(250),
   prix_ingredient DECIMAL(15,2),
   unite_ingredient VARCHAR(255),
   PRIMARY KEY(id_ingredient)
);

CREATE TABLE Categorie(
   id_categorie INT AUTO_INCREMENT,
   nom_categorie VARCHAR(255),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE Recette(
   id_recette INT AUTO_INCREMENT,
   nom_recette VARCHAR(255),
   temps_preparation INT,
   instruction TEXT,
   id_categorie INT NOT NULL,
   PRIMARY KEY(id_recette),
   FOREIGN KEY(id_categorie) REFERENCES Categorie(id_categorie)
);

CREATE TABLE Avoir(
   id_recette INT,
   id_ingredient INT,
   nb_quantite VARCHAR(255),
   PRIMARY KEY(id_recette, id_ingredient),
   FOREIGN KEY(id_recette) REFERENCES Recette(id_recette),
   FOREIGN KEY(id_ingredient) REFERENCES Ingredient(id_ingredient)
);



-- les données

INSERT INTO Categorie (nom_categorie) VALUES 
    ('Entree'),
    ('Plat'),
    ('Dessert');


INSERT INTO Ingredient (nom_ingredient, prix_ingredient, unite_ingredient)
VALUES 
    ('Tomate', 0.5, 'unité'),
    ('Poulet', 8, 'unité'),
    ('Pâte à tarte', 2, 'unité'),
    ('Pomme', 1, 'unité'),
    ('Sucre', 1.5, 'g'),
    ('Cannelle', 2, 'cuillère à café'),
    ('Spaghetti', 1, 'g'),
    ('Viande hachée', 5, 'g'),
    ('Laitue', 1, 'unité'),
    ('Chocolat', 3, 'g'),
    ('Œufs', 2, 'unité'),
    ('Concombres', 1.5, 'unité'),
    ('Poivrons', 2, 'unité'),
    ('Ail', 0.5, 'g'),
    ('Fromage à la crème', 4, 'g'),
    ('Riz', 3, 'g'),
    ('Viande pour tajine', 10, 'g'),
    ('Oignon', 1, 'unité'),
    ('Pomme de terre', 0.8, 'unité'),
    ('Pâte à pizza', 3, 'unité'),
    ('Sauce tomate', 2, 'g'),
    ('Fromage râpé', 2.5, 'g'),
    ('Ananas', 1.5, 'unité'),
    ('Viande pour kebab', 7, 'g'),
    ('Pain pita', 1, 'unité'),
    ('Salade', 0.7, 'unité'),
    ('Tomate pour kebab', 0.5, 'unité'),
    ('Oignon pour kebab', 0.3, 'unité'),
    ('Sauce blanche', 1, 'g');


INSERT INTO Recette (nom_recette, temps_preparation, instruction, id_categorie)
VALUES 
    ('Salade de tomates', 15, 'Couper les tomates en dés, ajouter de l\'huile d\'olive et du sel.', 1),
    ('Poulet rôti', 60, 'Assaisonner le poulet, le placer au four pendant 1 heure.', 2),
    ('Tarte aux pommes', 45, 'Éplucher les pommes, les couper en tranches, les disposer sur la pâte, saupoudrer de sucre et de cannelle.', 3),
    ('Spaghetti bolognaise', 30, 'Faire cuire les spaghetti, préparer la sauce bolognaise et servir ensemble.', 2),
    ('Salade César', 20, 'Mélanger la laitue, le poulet grillé, les croûtons et la sauce César.', 1),
    ('Mousse au chocolat', 120, 'Faire fondre le chocolat, incorporer les jaunes d\'œufs et les blancs en neige, laisser prendre au réfrigérateur.', 3),
    ('Tajine', 90, 'Préparer les légumes et la viande, les assaisonner, cuire lentement dans un tajine.', 2),
    ('Pizza ananas', 40, 'Étaler la pâte à pizza, ajouter la sauce tomate, le fromage et les morceaux d\'ananas, cuire au four.', 2),
    ('Doner kebab', 30, 'Préparer la viande, les légumes et la sauce, assembler dans un pain pita.', 2);


INSERT INTO Avoir (id_recette, id_ingredient, nb_quantite)
VALUES 
    -- Salade de tomates
    (1, 1, 4),

    -- Poulet rôti
    (2, 2, 1),
    
    -- Tarte aux pommes
    (3, 4, 6),
    (3, 5, 1),
    
    -- Spaghetti bolognaise
    (4, 6, 200),
    (4, 7, 300),
    
    -- Salade César
    (5, 8, 1),
    (5, 2, 1),
    
    -- Mousse au chocolat
    (6, 9, 200),
    (6, 10, 4),
    
    -- Tajine
    (7, 11, 500),
    (7, 12, 1),
    (7, 13, 2),
    (7, 14, 1),
    (11, 15, 1),
    (7, 16, 1),
    (7, 17, 1),
    
    -- Pizza ananas
    (8, 18, 1),
    (8, 19, 200),
    (8, 20, 200),
    (8, 21, 100),
    (8, 22, 4),
    (8, 23, 100),
    
    -- Doner kebab
    (9, 24, 400),
    (9, 25, 1),
    (9, 26, 1),
    (9, 27, 1),
    (9, 28, 1),
    (9, 29, 1);




