-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】MySQLにはINTERSECT構文がないため、2つのサブクエリをINNER JOINで
--         結合することで積集合（INTERSECT相当）を実現する。
--         BIKEとSKATEBOARDを両方購入した顧客を取得する例。

USE SalesOrdersSample;

-- BIKEを購入した顧客とSKATEBOARDを購入した顧客をINNER JOINで絞り込む
SELECT C.CustFirstName, C.CustLastName
FROM 
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Bike') AS C
INNER JOIN
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName = 'Skateboard') AS C2
ON C.CustFirstName = C2.CustFirstName
  AND C.CustLastName = C2.CustLastName;

  -- Sample query that returns results:
-- LIKE演算子を使って実データで結果が返るサンプルクエリ
SELECT C.CustFirstName, C.CustLastName
FROM 
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Bike%') AS C
INNER JOIN
  (SELECT DISTINCT Customers.CustFirstName, Customers.CustLastName
  FROM Customers INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details
    ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
    ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName LIKE '%Skateboard%') AS C2
ON C.CustFirstName = C2.CustFirstName
  AND C.CustLastName = C2.CustLastName;