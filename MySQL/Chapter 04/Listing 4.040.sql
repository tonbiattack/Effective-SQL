-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】LEFT JOINのフィルタリング問題の最も推奨される解決パターン。
--         サブクエリ内でWHEREによる日付絞り込みを事前に行い、
--         絞り込み済みの結果セットをLEFT JOINすることで注文なし顧客も正しく保持する。

USE SalesOrdersSample;

-- 推奨例: サブクエリ内でフィルタしてから LEFT JOIN することで注文なし顧客も保持
SELECT Customers.CustomerID, Customers.CustFirstName,
  Customers.CustLastName, OFiltered.OrderNumber,
  OFiltered.OrderDate, OFiltered.OrderTotal
FROM Customers LEFT JOIN
  (SELECT Orders.OrderNumber, Orders.CustomerID,
    Orders.OrderDate, Orders.OrderTotal
  FROM Orders
  -- サブクエリ内で日付範囲を絞り込む（ON句での結合前にフィルタリング）
  WHERE Orders.OrderDate BETWEEN CAST('2015-10-01' AS DATETIME)
    AND CAST('2015-12-31' AS DATETIME)) AS OFiltered
  ON Customers.CustomerID = OFiltered.CustomerID;
