-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】INNER JOINの多段結合でメインコース（Main Course）かつスパイス使用数が
--         3種未満のレシピを取得する。HAVINGでグループ集計後の条件を指定するが、
--         INNER JOINのためスパイスを0種使うレシピが除外されてしまう問題がある（5.025参照）。

USE RecipesSample;

-- 問題: INNER JOINでスパイスが0種のレシピが取得されない
SELECT Recipes.RecipeTitle,
  COUNT(Recipe_Ingredients.RecipeID) AS IngredCount
FROM (((Recipe_Classes
  INNER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID)
  INNER JOIN Recipe_Ingredients
    ON Recipes.RecipeID = Recipe_Ingredients.RecipeID)
  INNER JOIN Ingredients
    ON Recipe_Ingredients.IngredientID =
    Ingredients.IngredientID)
  INNER JOIN Ingredient_Classes
    ON Ingredients.IngredientClassID =
    Ingredient_Classes.IngredientClassID
-- メインコースかつスパイスカテゴリの食材のみに絞り込む
WHERE Recipe_Classes.RecipeClassDescription = 'Main Course'
  AND Ingredient_Classes.IngredientClassDescription = 'Spice'
GROUP BY Recipes.RecipeTitle
-- スパイス使用数が3種未満のレシピを抽出
HAVING COUNT(Recipe_Ingredients.RecipeID) < 3;
