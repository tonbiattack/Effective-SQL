-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】INNER JOINを4回重ねることで、Skateboard/Helmet/Knee Pads/Gloves
--         全てを購入した顧客（全集合の積集合）を取得する。
--         各商品のサブクエリでDISTINCTなCustomerIDを取り出しJOINで絞り込む。

USE SalesOrdersSample;

-- 各商品購入者のサブクエリを順次INNER JOINして全商品購入者を抽出
SELECT C.CustomerID, C.CustFirstName, C.CustLastName
FROM Customers AS C INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Skateboard') AS OSk
ON C.CustomerID = OSk.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Helmet') AS OHel
ON C.CustomerID = OHel.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Knee Pads') AS OKn
ON C.CustomerID = OKn.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Gloves') AS OGl
ON C.CustomerID = OGl.CustomerID;

-- Sample query that returns results:
SELECT C.CustomerID, C.CustFirstName, C.CustLastName
FROM Customers AS C INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Skateboard%') AS OSk
ON C.CustomerID = OSk.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Helmet%') AS OHel
ON C.CustomerID = OHel.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Knee Pads%') AS OKn
ON C.CustomerID = OKn.CustomerID
INNER JOIN
  (SELECT DISTINCT Orders.CustomerID
  FROM Orders INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products 
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Gloves%') AS OGl
ON C.CustomerID = OGl.CustomerID;

