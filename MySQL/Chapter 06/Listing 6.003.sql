-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】2015年12月に注文されなかった商品をNOT INで取得する。
--         期間内に注文された商品IDのサブクエリを作成し、NOT INで差集合を求める。

USE SalesOrdersSample;

-- 2015年12月に注文のなかった商品名を取得（NOT IN差集合パターン）
SELECT Products.ProductName
FROM Products
WHERE Products.ProductNumber NOT IN
  -- 2015年12月に注文された商品IDのサブクエリ
  (SELECT Order_Details.ProductNumber
   FROM Orders
      INNER JOIN Order_Details
        ON Orders.OrderNumber = Order_Details.OrderNumber
   WHERE Orders.OrderDate
    BETWEEN '2015-12-01' AND '2015-12-31');
