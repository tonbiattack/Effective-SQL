-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】4.038の問題をOR IS NULL条件で修正した例。
--         注文のない顧客（Orders.OrderNumber IS NULL）もOR条件で明示的に保持する。
--         ただし推奨パターンはON句でのフィルタ（4.040）。

USE SalesOrdersSample;

-- 改善例: IS NULLをOR条件で追加して注文なし顧客のNULL行を保持する
SELECT Customers.CustomerID, Customers.CustFirstName,
  Customers.CustLastName, Orders.OrderNumber, Orders.OrderDate,
  Orders.OrderTotal
FROM Customers LEFT JOIN Orders
  ON Customers.CustomerID = Orders.CustomerID
WHERE (Orders.OrderDate BETWEEN CAST('2015-10-01' AS DATETIME)
    AND CAST('2015-12-31' AS DATETIME))
  OR Orders.OrderNumber IS NULL;
