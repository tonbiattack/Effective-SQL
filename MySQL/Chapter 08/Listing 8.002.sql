-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】INNER JOINを使用して実際に販売された全商品のリストを取得する。OrdersとOrder_DetailsをINNER JOINして注文番号・顧客ID・商品番号を抽出する。

USE SalesOrdersSample;

-- Listing 8.2 Determining all products sold
-- OrdersとOrder_DetailsをINNER JOINして販売済み商品を取得
SELECT O.OrderNumber, O.CustomerID, OD.ProductNumber
FROM Orders AS O INNER JOIN Order_Details AS OD
  ON O.OrderNumber = OD.OrderNumber;

