-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】COUNT(*)をLEFT JOINと組み合わせる問題のある例。
--         COUNT(*)はNULL行（レシピのないクラス）も1としてカウントするため
--         レシピ0件のクラスが1件と誤ってカウントされる。5.022と比較すること。

USE RecipesSample;

-- 問題: COUNT(*)はNULL行も1にカウントするためレシピなしのクラスが0にならない
SELECT Recipe_Classes.RecipeClassDescription,
  COUNT(*) AS RecipeCount
FROM Recipe_Classes
  LEFT OUTER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
GROUP BY Recipe_Classes.RecipeClassDescription;
