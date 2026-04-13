-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】EXISTS相関サブクエリを複数使い、牛肉とにんにくを両方使うレシピを取得する。
--         6.001/6.007のINNER JOINパターンと同等の結果をEXISTSで実現する。

USE RecipesSample;

-- 牛肉とにんにくを両方使うレシピをEXISTS相関サブクエリで取得
SELECT Recipes.RecipeTitle
FROM Recipes
-- 牛肉（Beef）が使われているか確認する相関サブクエリ
WHERE EXISTS
  (SELECT NULL
   FROM Ingredients INNER JOIN Recipe_Ingredients
     ON Ingredients.IngredientID =
          Recipe_Ingredients.IngredientID
   WHERE Ingredients.IngredientName = 'Beef'
      AND Recipe_Ingredients.RecipeID = Recipes.RecipeID)
-- にんにく（Garlic）が使われているか確認する相関サブクエリ
AND EXISTS
  (SELECT NULL
   FROM Ingredients INNER JOIN Recipe_Ingredients
     ON Ingredients.IngredientID =
          Recipe_Ingredients.IngredientID
   WHERE Ingredients.IngredientName = 'Garlic'
      AND Recipe_Ingredients.RecipeID = Recipes.RecipeID);
