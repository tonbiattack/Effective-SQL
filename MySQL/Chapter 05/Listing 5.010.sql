-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】顧客ごとの注文集計（最終注文日・件数・合計）をLEFT JOINで取得する基本パターン。
--         GROUP BY句に非集計列（CustFirstName等）を全て列挙する標準SQLの書き方。

USE SalesOrdersSample;

-- GROUP BYに全非集計列を指定して顧客ごとの注文サマリを取得
SELECT c.CustomerID, c.CustFirstName, c.CustLastName, c.CustState,
  MAX(o.OrderDate) AS LastOrderDate, COUNT(o.OrderNumber) AS OrderCount,
  SUM(o.OrderTotal) AS TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustFirstName, c.CustLastName, c.CustState;
