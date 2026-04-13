-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】NOT EXISTSを使って、一度も注文されたことがない商品を取得する。
--         相関サブクエリでOrder_Detailsに対応行が存在しないことを確認する。
--         NOT INと異なりNULL値の影響を受けない点が利点。

USE SalesOrdersSample;

-- Listing 4.5 Using an Existence check

-- 相関サブクエリでOrder_Detailsに存在しない商品をフィルタリング
SELECT P.ProductNumber, P.ProductName
FROM Products AS P
WHERE NOT EXISTS
  (SELECT *
   FROM Order_Details AS OD
   WHERE OD.ProductNumber = P.ProductNumber);
