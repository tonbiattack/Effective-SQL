-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】SELECT句の相関サブクエリでレシピクラスごとのレシピ数を取得する。
--         5.023と同様のパターン（RecipesサンプルDB版）。
--         COUNT(*)を使っているためレシピなしクラスは0件で正しく表示される。

USE RecipesSample;

-- SELECT句の相関サブクエリで各クラスのレシピ件数を取得
SELECT Recipe_Classes.RecipeClassDescription,
       (SELECT COUNT(*)
        FROM Recipes
        WHERE Recipes.RecipeClassID =
           Recipe_Classes.RecipeClassID) AS RecipeCount
FROM Recipe_Classes;
