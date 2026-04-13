-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】NOT INを使って、一度も注文されたことがない商品（Order_Detailsに
--         存在しない商品）を取得する。サブクエリでOrder_Detailsの全ProductNumberを
--         列挙し、Productsテーブルとの差集合を求める。

USE SalesOrdersSample;

-- Listing 4.4 Using NOT IN

-- Order_Detailsに存在しない（未注文の）商品を取得
SELECT P.ProductNumber, P.ProductName
FROM Products AS P
WHERE P.ProductNumber NOT IN (SELECT ProductNumber FROM Order_Details);

