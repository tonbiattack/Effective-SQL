-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】CASE式をWHERE句で使用して複雑な絞り込みを実現する。
--         「Skateboardを購入しているが、HelmetまたはKnee Pads/Glovesは購入していない」
--         顧客をCASE式の戻り値（0/1）で判定するパターン。

USE SalesOrdersSample;

-- CASE式でSkateboardの購入有無とHelmetの購入有無を評価して顧客を絞り込む
SELECT CustomerID, CustFirstName, CustLastName
FROM Customers
WHERE (1 =
  (CASE WHEN CustomerID NOT IN
    (SELECT Orders.CustomerID 
    FROM Orders INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
    INNER JOIN Products
    ON Order_Details.ProductNumber = Products.ProductNumber
    WHERE Products.ProductName = 'Skateboard')
  THEN 0
  WHEN CustomerID IN
    (SELECT Orders.CustomerID 
    FROM Orders INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
    INNER JOIN Products
    ON Order_Details.ProductNumber = Products.ProductNumber
    WHERE Products.ProductName = 'Helmet')
  THEN 0
  ELSE 1 END));
  
  -- Sample query that returns results:
  SELECT CustomerID, CustFirstName, CustLastName
FROM Customers
WHERE (1 = 
  (CASE WHEN CustomerID NOT IN
    (SELECT Orders.CustomerID 
    FROM Orders INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
    INNER JOIN Products
    ON Order_Details.ProductNumber = Products.ProductNumber
    WHERE Products.ProductName LIKE '%Skateboard%')
  THEN 0
  WHEN CustomerID IN
    (SELECT Orders.CustomerID 
    FROM Orders INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
    INNER JOIN Products
    ON Order_Details.ProductNumber = Products.ProductNumber
    WHERE Products.ProductName LIKE '%Helmet%')
  THEN 0
  ELSE 1 END));