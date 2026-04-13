-- Ensure you've run Item33StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】BeerStylesを自己結合して各行のMaxABV比較を行う中間クエリ。
--         自分より高いMaxABVが存在する行を探すためのLEFT JOINパターン。
--         5.020のフィルタリング（WHERE R.MaxABV IS NULL）の前段となる。

USE Item33Example;

-- Listing 5.19 Joining the BeerStyles table to itself to compare MaxABV in each row.
-- 自己LEFT JOIN: 同カテゴリ内でMaxABVがより大きい行をRとして結合
SELECT L.Category, L.MaxABV AS LeftMaxABV, R.MaxABV AS RightMaxABV
FROM BeerStyles AS L
LEFT JOIN BeerStyles AS R
  ON L.Category = R.Category
    AND L.MaxABV < R.MaxABV;


