
-- Ensure you've run Item33StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】ビールスタイルテーブルからカテゴリごとの最高アルコール度数を取得する。
--         GROUP BY + MAX()の基本集計クエリ。

USE Item33Example;

-- Listing 5.17 SQL Statement to determine highest alcohol level per category
-- カテゴリごとにMaxABV（最高アルコール度数）の最大値を取得
SELECT Category, Max(MaxABV) AS MaxAlcohol
FROM BeerStyles
GROUP BY Category;


