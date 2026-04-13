-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】二重NOT EXISTSを使ったリレーショナル除算のパターン。
--         「ProdsOfInterestの全商品を購入している顧客」を
--         「購入していない商品が存在しない顧客」として表現する。

USE SalesOrdersSample;

-- CustomerProductsビュー: 顧客と購入商品の対応
CREATE VIEW CustomerProducts AS
SELECT DISTINCT Customers.CustomerID, Customers.CustFirstName, 
  Customers.CustLastName, Products.ProductName
FROM Customers INNER JOIN Orders
  ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
INNER JOIN Products
  ON Products.ProductNumber = Order_Details.ProductNumber;

CREATE VIEW ProdsOfInterest AS
SELECT Products.ProductName
FROM Products
WHERE ProductName IN 
  ('Skateboard', 'Helmet', 'Knee Pads', 'Gloves');

-- 二重NOT EXISTS: 「PofIの全商品を購入していない場合が存在しない」顧客を抽出
SELECT DISTINCT CustomerID, CustFirstName, CustLastName
FROM CustomerProducts AS CP1
WHERE NOT EXISTS
  (SELECT ProductName FROM ProdsOfInterest AS PofI
    WHERE NOT EXISTS
    (SELECT CustomerID FROM CustomerProducts AS CP2
      WHERE CP2.CustomerID = CP1.CustomerID
      AND CP2.ProductName = PofI.ProductName));
	  
DROP VIEW CustomerProducts;
DROP VIEW ProdsOfInterest;

-- Sample query that searches products correctly:
CREATE VIEW CustomerProducts AS
SELECT DISTINCT Customers.CustomerID, Customers.CustFirstName,
  Customers.CustLastName,
       CASE WHEN Products.ProductName LIKE '%Skateboard%' THEN 'Skateboard'
              WHEN Products.ProductName LIKE '%Helmet%' THEN 'Helmet'
              WHEN Products.ProductName LIKE '%Knee Pads%' THEN 'Knee Pads'
              WHEN Products.ProductName LIKE '%Gloves%' THEN 'Gloves'
              ELSE NULL
       END AS ProductCategory
FROM Customers INNER JOIN Orders
  ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
INNER JOIN Products
  ON Products.ProductNumber = Order_Details.ProductNumber;

CREATE VIEW ProdsOfInterest AS
SELECT DISTINCT 
       CASE WHEN Products.ProductName LIKE '%Skateboard%' THEN 'Skateboard'
              WHEN Products.ProductName LIKE '%Helmet%' THEN 'Helmet'
              WHEN Products.ProductName LIKE '%Knee Pads%' THEN 'Knee Pads'
              WHEN Products.ProductName LIKE '%Gloves%' THEN 'Gloves'
              ELSE NULL
       END AS ProductCategory
FROM Products
WHERE ProductName LIKE '%Skateboard%'
   OR ProductName LIKE '%Helmet%'
   OR ProductName LIKE '%Knee Pads%'
   OR ProductName LIKE '%Gloves%';

SELECT DISTINCT CustomerID, CustFirstName, CustLastName
FROM CustomerProducts AS CP1
WHERE NOT EXISTS
  (SELECT ProductCategory FROM ProdsOfInterest AS PofI
    WHERE NOT EXISTS
    (SELECT CustomerID FROM CustomerProducts AS CP2
      WHERE CP2.CustomerID = CP1.CustomerID
      AND CP2.ProductCategory = PofI.ProductCategory));

DROP VIEW CustomerProducts;
DROP VIEW ProdsOfInterest;

