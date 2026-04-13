-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Products テーブルからカテゴリ ID が 1・5・9 の商品を
--         ProductName の昇順で取得するクエリ。
--         インデックスによるソート操作の回避を説明する例。

USE SalesOrdersSample;

-- Listing 2.24 Sample query that requires a sort operation
-- IN 句でカテゴリを絞り込み、商品名でソート
SELECT ProductNumber, ProductName
  FROM Products
WHERE CategoryID IN (1, 5, 9)   -- カテゴリID 1・5・9 に限定
ORDER BY ProductName;            -- 商品名の昇順ソート