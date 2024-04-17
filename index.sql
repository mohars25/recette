1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation

SELECT r.nom_recette, c.nom_categorie, r.temps_preparation
FROM Recette r
JOIN Categorie c ON r.id_categorie = c.id_categorie
ORDER BY r.temps_preparation DESC;



2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

SELECT r.nom_recette, c.nom_categorie, r.temps_preparation, COUNT(av.id_INGREDIENT) AS nombre_INGREDIENT
FROM Recette r
JOIN Categorie c ON r.id_categorie = c.id_categorie
LEFT JOIN Avoir av ON r.id_recette = av.id_recette
GROUP BY r.id_recette
ORDER BY r.temps_preparation DESC;





3- Afficher les recettes qui nécessitent au moins 30 min de préparation

SELECT nom_recette, temps_preparation
FROM Recette
WHERE temps_preparation >= 30;



4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question)


SELECT nom_recette
FROM Recette
WHERE nom_recette LIKE '%Salade%';





5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients)

INSERT INTO Recette (nom_recette, temps_preparation, instructions, id_categorie)
VALUES ('Pâtes à la carbonara', 20, 'Instructions de préparation des pâtes à la carbonara', id_categorie_de_votre_choix);



6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
convenance)

UPDATE Recette
SET nom_recette = 'pizza ananas'
WHERE id_recette = 3;



7- Supprimer la recette n°2 de la base de données

DELETE FROM Recette
WHERE id_recette = 2;



8- Afficher le prix total de la recette n°5


SELECT SUM(i.prix_ingredient * CAST(a.nb_quantite AS DECIMAL))
FROM Ingredient i
JOIN Avoir a ON i.id_INGREDIENT = a.id_INGREDIENT
WHERE a.id_recette = 5;


9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)

SELECT i.nom_ingredient, a.nb_quantite, i.prix_ingredient
FROM Ingredient i
JOIN Avoir a ON i.id_INGREDIENT = a.id_INGREDIENT
WHERE a.id_recette = 5;



10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

INSERT INTO Ingredient (nom_ingredient, prix_ingredient, unite_ingredient)
VALUES ('Poivre', 2.5, 'cuillère à café');



11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)

UPDATE Ingredient
SET prix_ingredient = Nouveau_prix
WHERE id_INGREDIENT = 12;






12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

SELECT c.nom_categorie, COUNT(r.id_recette) AS nombre_recettes
FROM Categorie c
LEFT JOIN Recette r ON c.id_categorie = r.id_categorie
GROUP BY c.nom_categorie;




13- Afficher les recettes qui contiennent l’ingrédient « Poulet »

SELECT r.nom_recette
FROM Recette r
JOIN Avoir a ON r.id_recette = a.id_recette
JOIN Ingredient i ON a.id_INGREDIENT = i.id_INGREDIENT
WHERE i.nom_ingredient = 'Poulet';







14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes 
UPDATE Recette
SET temps_preparation = temps_preparation - 5;




15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure

SELECT r.nom_recette
FROM Recette r
LEFT JOIN Recette_Ingrédient ri ON r.id_recette = ri.id_recette
LEFT JOIN Ingrédient i ON ri.id_ingredient = i.id_ingredient
WHERE i.prix / (SELECT COUNT(DISTINCT id_unite) FROM Ingrédient) <= 2
GROUP BY r.id_recette;

SELECT r.nom_recette
FROM Recette r
LEFT JOIN Avoir a ON r.id_recette = a.id_recette
LEFT JOIN Ingredient i ON a.id_INGREDIENT = i.id_INGREDIENT
GROUP BY r.nom_recette
HAVING MAX(i.prix_ingredient) <= 2 OR MAX(i.prix_ingredient) IS NULL;






16- Afficher la / les recette(s) les plus rapides à préparer

SELECT nom_recette, temps_preparation
FROM Recette
ORDER BY temps_preparation ASC
LIMIT 1;




17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
chaude qui consiste à verser de l’eau chaude dans une tasse)

SELECT r.nom_recette
FROM Recette r
LEFT JOIN Avoir a ON r.id_recette = a.id_recette
WHERE a.id_INGREDIENT IS NULL;



18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes


SELECT i.nom_ingredient, COUNT(a.id_recette) AS nombre_recettes
FROM Ingredient i
JOIN Avoir a ON i.id_INGREDIENT = a.id_INGREDIENT
GROUP BY i.nom_ingredient
HAVING COUNT(DISTINCT a.id_recette) >= 3;




19- Ajouter un nouvel ingrédient à une recette spécifique

INSERT INTO Recette_Ingrédient (id_recette, id_ingredient, quantite)
VALUES (5, 21, quantite);

INSERT INTO Avoir (id_recette, id_INGREDIENT, nb_quantite)
VALUES (1, id_ingredient_tomate, '2');




20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
donc exclu d’utiliser la clause LIMIT)

SELECT nom_recette
FROM Recette
WHERE id_recette = (
    SELECT id_recette
    FROM Avoir
    JOIN Ingredient ON Avoir.id_INGREDIENT = Ingredient.id_INGREDIENT
    ORDER BY prix_ingredient DESC
    LIMIT 1
);
