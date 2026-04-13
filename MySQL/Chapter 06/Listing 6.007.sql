-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】6.001と同様のパターン（整形版）。牛肉とにんにくを両方使うレシピを
--         サブクエリINNER JOINで取得する。可読性向上のためインデントを整理した版。

USE RecipesSample;

-- 牛肉を使うレシピのサブクエリ
SELECT BeefRecipes.RecipeTitle
FROM
  (SELECT Recipes.RecipeID, Recipes.RecipeTitle
   FROM (Recipes INNER JOIN Recipe_Ingredients
      ON Recipes.RecipeID = Recipe_Ingredients.RecipeID)
    INNER JOIN Ingredients
      ON Ingredients.IngredientID =
           Recipe_Ingredients.IngredientID
   WHERE Ingredients.IngredientName = 'Beef') AS BeefRecipes
-- にんにくを使うレシピのサブクエリとINNER JOIN（積集合）
INNER JOIN
  (SELECT Recipe_Ingredients.RecipeID
   FROM Recipe_Ingredients INNER JOIN Ingredients
     ON Ingredients.IngredientID =
          Recipe_Ingredients.IngredientID
   WHERE Ingredients.IngredientName = 'Garlic') AS GarlicRecipes
  ON BeefRecipes.RecipeID = GarlicRecipes.RecipeID;
