-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】相関サブクエリをSELECT句に配置してレシピ数を取得する代替パターン。
--         LEFT JOINを使わず、SELECT句のサブクエリで各クラスのレシピ数を計算する。
--         レシピなしのクラスはサブクエリが0を返すため正しくカウントされる。

USE RecipesSample;

-- SELECT句の相関サブクエリで各レシピクラスのレシピ数を取得
SELECT Recipe_Classes.RecipeClassDescription,
  (SELECT COUNT(Recipes.RecipeClassID)
   FROM Recipes
   WHERE Recipes.RecipeClassID = Recipe_Classes.RecipeClassID)
    AS RecipeCount
FROM Recipe_Classes;
