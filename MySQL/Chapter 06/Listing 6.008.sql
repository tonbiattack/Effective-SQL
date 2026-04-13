-- Ensure you've run RecipesStructure.sql
-- and RecipesData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】INのネストサブクエリで、サラダ/スープ/メインコースに属するレシピを取得する。
--         外側のINがRecipeClassIDで絞り込み、内側のサブクエリがクラス名から
--         対応するIDを取得する2段階のINフィルタパターン。

USE RecipesSample;

-- Recipe_ClassesからSalad/Soup/Main CourseのIDを取得してRecipesを絞り込む
SELECT Recipes.RecipeTitle
FROM Recipes
WHERE Recipes.RecipeClassID IN
  (SELECT RC.RecipeClassID
   FROM Recipe_Classes AS RC
   WHERE RC.RecipeClassDescription IN
    ('Salad', 'Soup', 'Main Course'));
