-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】NOT EXISTSを使用して一度も注文されたことのない商品を取得する。サブクエリによる非存在チェックのパフォーマンス検証用クエリ。

USE SalesOrdersSample;

-- Order_Detailsに存在しない（未注文の）商品を全列取得
SELECT p.*
FROM Products AS p
WHERE NOT EXISTS (
    SELECT NULL
    FROM Order_Details AS d
    WHERE p.ProductNumber = d.ProductNumber
);
