-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】EXISTSサブクエリを複数使い、SkateboardとHelmetを両方含む注文と
--         その顧客情報を取得する。EXISTS内でSELECT NULLを使う推奨パターン。

USE SalesOrdersSample;

-- SkateboardとHelmetを両方含む注文を持つ顧客を取得
SELECT Customers.CustomerID, Customers.CustFirstName,
  Customers.CustLastName, Orders.OrderNumber, Orders.OrderDate
FROM Customers
  INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
-- 同じ注文番号でSkateboardが存在するか確認
WHERE EXISTS
  (SELECT NULL
   FROM (Orders AS O2
      INNER JOIN Order_Details
        ON O2.OrderNumber = Order_Details.OrderNumber)
      INNER JOIN Products
        ON Products.ProductNumber = Order_Details.ProductNumber 
   WHERE Products.ProductName = 'Skateboard' 
    AND O2.OrderNumber = Orders.OrderNumber)
AND EXISTS 
  (SELECT NULL 
   FROM (Orders AS O3 
      INNER JOIN Order_Details
        ON O3.OrderNumber = Order_Details.OrderNumber)
      INNER JOIN Products
        ON Products.ProductNumber = Order_Details.ProductNumber 
   WHERE Products.ProductName = 'Helmet'
      AND O3.OrderNumber = Orders.OrderNumber);
	  
-- Second example using LIKE to fetch real data
SELECT Customers.CustomerID, Customers.CustFirstName, 
  Customers.CustLastName, Orders.OrderNumber, Orders.OrderDate
FROM Customers
  INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
WHERE EXISTS 
  (SELECT NULL
   FROM (Orders AS O2
      INNER JOIN Order_Details
        ON O2.OrderNumber = Order_Details.OrderNumber)
      INNER JOIN Products
        ON Products.ProductNumber = Order_Details.ProductNumber 
   WHERE Products.ProductName LIKE '%Skateboard%' 
    AND O2.OrderNumber = Orders.OrderNumber)
AND EXISTS 
  (SELECT NULL
   FROM (Orders AS O3 
      INNER JOIN Order_Details
        ON O3.OrderNumber = Order_Details.OrderNumber)
      INNER JOIN Products
        ON Products.ProductNumber = Order_Details.ProductNumber 
   WHERE Products.ProductName LIKE '%Helmet%'
      AND O3.OrderNumber = Orders.OrderNumber);


