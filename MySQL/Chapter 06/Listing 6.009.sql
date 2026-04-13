-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】WHERE句のサブクエリで全レシピ中のにんにく最大使用量を取得し、
--         その量を使うレシピを抽出する。非相関サブクエリでMAX値を計算するパターン。

USE RecipesSample;

-- にんにくを最大量使うレシピを取得（非相関サブクエリでMAX量を算出）
SELECT DISTINCT Recipes.RecipeTitle
FROM Recipes INNER JOIN Recipe_Ingredients
    ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
  INNER JOIN Ingredients
    ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
WHERE (Ingredients.IngredientName = 'Garlic') AND
      -- にんにくの全レシピ中の最大使用量をサブクエリで取得
      (Recipe_Ingredients.Amount =
        (SELECT MAX(Amount)
         FROM Recipe_Ingredients INNER JOIN Ingredients
            ON Recipe_Ingredients.IngredientID =
                 Ingredients.IngredientID
         WHERE IngredientName = 'Garlic'));
