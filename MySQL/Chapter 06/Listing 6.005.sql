-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】SELECT句の相関サブクエリで各商品の最終注文日を取得する。
--         全商品を列挙しながら、商品ごとに最新の注文日を動的に計算する。

USE SalesOrdersSample;

-- SELECT句の相関サブクエリで商品ごとの最終注文日を取得
SELECT Products.ProductNumber, Products.ProductName,
  (SELECT MAX(Orders.OrderDate)
   FROM Orders
      INNER JOIN Order_Details
        ON Orders.OrderNumber = Order_Details.OrderNumber
   WHERE Order_Details.ProductNumber = Products.ProductNumber)
    AS LastOrder
FROM Products;
