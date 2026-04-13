-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】牛肉（Beef）とにんにく（Garlic）を両方使うレシピをINNER JOINで取得する。
--         各食材を使うレシピIDのサブクエリを作成し、INNER JOINで積集合を求める。

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
   WHERE Ingredients.IngredientName = 'Beef')
      AS BeefRecipes
  -- にんにくを使うレシピのサブクエリとINNER JOIN（両方使うレシピを抽出）
  INNER JOIN
  (SELECT Recipe_Ingredients.RecipeID
   FROM Recipe_Ingredients INNER JOIN Ingredients
    ON Ingredients.IngredientID =
      Recipe_Ingredients.IngredientID
   WHERE Ingredients.IngredientName = 'Garlic')
      AS GarlicRecipes
    ON BeefRecipes.RecipeID = GarlicRecipes.RecipeID;
