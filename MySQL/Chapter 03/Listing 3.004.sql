-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Listing 3.003 で作成した3つのビューを結合した処理を、
--         インラインサブクエリとして1つの SQL 文に展開した同等クエリ。

USE SalesOrdersSample;

-- Listing 3.4 Equivalent statement of combined views
-- ビューを使わず同等の結果をインラインサブクエリで実現
SELECT c.CustomerID, c.CustFirstName, c.CustLastName,
  s.LastOrderDate, s.GrandOrderTotal
FROM Customers AS c
-- 顧客統計をインラインビューで算出して結合
INNER JOIN
  (SELECT o.CustomerID, SUM(o.OrderTotal) AS GrandOrderTotal,
    MAX(o.OrderDate) AS LastOrderDate
   FROM Orders AS o
   GROUP BY o.CustomerID) AS s
  ON c.CustomerID = s.CustomerID
-- 過去6ヶ月以内に注文がある顧客のみに絞り込む
WHERE EXISTS
 (SELECT NULL
  FROM Orders AS o
  WHERE o.CustomerID = c.CustomerID
    AND o.OrderDate > DATE_ADD(CURDATE(), INTERVAL -6 MONTH)); 
