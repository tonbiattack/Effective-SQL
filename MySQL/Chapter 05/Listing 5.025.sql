-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】5.024の問題を修正した第1の改善パターン。
--         スパイス食材をLEFT OUTER JOIN＋ON句フィルタで結合し、
--         スパイスを使わないレシピ（COUNT=0）も取得できるようにする。
--         ただしON句でのフィルタと同等のWHEREフィルタに注意。

USE RecipesSample;

-- スパイス食材をLEFT OUTER JOINで結合（ON句でSPiceを絞り込み）
SELECT Recipes.RecipeTitle,
  COUNT(RI.RecipeID) AS IngredCount
FROM (Recipe_Classes
  INNER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID)
  LEFT OUTER JOIN
     -- スパイスカテゴリの食材のみを含むサブクエリ
     (SELECT Recipe_Ingredients.RecipeID,
         Ingredient_Classes.IngredientClassDescription
      FROM (Recipe_Ingredients
        INNER JOIN Ingredients
          ON Recipe_Ingredients.IngredientID =
      Ingredients.IngredientID)
        INNER JOIN Ingredient_Classes
          ON Ingredients.IngredientClassID =
         Ingredient_Classes.IngredientClassID) AS RI
    ON Recipes.RecipeID = RI.RecipeID AND RI.IngredientClassDescription = 'Spice'
WHERE Recipe_Classes.RecipeClassDescription = 'Main course'
GROUP BY Recipes.RecipeTitle
HAVING COUNT(RI.RecipeID) < 3;
