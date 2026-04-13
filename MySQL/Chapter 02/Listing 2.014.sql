-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersDataMy.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Orders テーブルを CustomerID でグループ化し、
--         各顧客の注文合計金額（SumOrderTotal）を集計するクエリ

USE SalesOrdersSample;

-- 顧客ごとの注文合計額を集計
SELECT CustomerID, Sum(OrderTotal) AS SumOrderTotal
FROM Orders
GROUP BY CustomerID;
