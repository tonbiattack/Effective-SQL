-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】MySQLのGROUP BY拡張（ONLY_FULL_GROUP_BY無効時）を利用した省略形。
--         CustomerIDのみでGROUP BYし、他の非集計列はMySQLが任意の値を選択する。
--         標準SQLでは非推奨。ONLY_FULL_GROUP_BY有効環境では5.010を使用すること。

USE SalesOrdersSample;

-- MySQLの非標準動作: GROUP BYにCustomerIDのみ指定し他の列を省略
SELECT c.CustomerID, c.CustFirstName, c.CustLastName, c.CustState,
  MAX(o.OrderDate) AS LastOrderDate, COUNT(o.OrderNumber) AS OrderCount,
  SUM(o.OrderTotal) AS TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;
