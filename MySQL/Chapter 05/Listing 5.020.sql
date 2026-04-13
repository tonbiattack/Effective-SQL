-- Ensure you've run Item33StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】自己LEFT JOINでカテゴリごとの最高アルコール度数レコードを取得する。
--         R.MaxABV IS NULL（自分より大きい値が存在しない行）がカテゴリ内最大値の行。
--         サブクエリなしで最大値行の全詳細を取得できるパターン。

USE Item33Example;


-- Listing 5.20 Returning details of the row with the largest value of MaxABV for each category.
-- WHERE R.MaxABV IS NULLで「自分より大きいMaxABVが存在しない（最大値）行」を抽出
SELECT L.Category, L.Country, L.Style, L.MaxABV AS MaxAlcohol
FROM BeerStyles AS L LEFT JOIN BeerStyles AS R
  ON L.Category = R.Category
    AND L.MaxABV < R.MaxABV
WHERE R.MaxABV IS NULL
ORDER BY L.Category;


