-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】5.021の修正版。COUNT(列名)はNULL値を除外してカウントするため、
--         レシピのないクラスは正しく0件と表示される推奨パターン。

USE RecipesSample;

-- 良い例: COUNT(列名)でNULLを除外し、レシピなしのクラスを正しく0件でカウント
SELECT Recipe_Classes.RecipeClassDescription, COUNT(Recipes.RecipeClassID) AS RecipeCount
FROM Recipe_Classes
  LEFT OUTER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
GROUP BY Recipe_Classes.RecipeClassDescription;
