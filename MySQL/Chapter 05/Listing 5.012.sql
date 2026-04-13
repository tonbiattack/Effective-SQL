-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】サブクエリで先にOrders集計を行い、その結果をLEFT JOINで結合する推奨パターン。
--         集計済みサブクエリをON句で結合することで、標準準拠かつ効率的に顧客集計を取得する。

USE SalesOrdersSample;

-- サブクエリでOrders集計後、Customersにジョイン（標準SQLに準拠した推奨形）
SELECT c.CustomerID, c.CustFirstName, c.CustLastName, c.CustState,
  o.LastOrderDate, o.OrderCount, o.TotalAmount
FROM Customers AS c
LEFT JOIN
   -- CustomerIDごとに注文の集計サブクエリ
   (SELECT t.CustomerID, MAX(t.OrderDate) AS LastOrderDate,
    COUNT(t.OrderNumber) AS OrderCount, SUM(t.OrderTotal) AS TotalAmount
    FROM Orders AS t
    GROUP BY t.CustomerID) AS o
  ON c.CustomerID = o.CustomerID;