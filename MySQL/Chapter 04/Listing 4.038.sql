-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】LEFT JOINとWHERE句のフィルタ組み合わせの問題を示す悪い例。
--         LEFT JOINで結合した後WHERE句で注文日を絞ると、注文のない顧客（NULL行）が
--         除外されてしまい、実質的にINNER JOINと同じ結果になる。

USE SalesOrdersSample;

-- 悪い例: WHERE句のフィルタがNULL行を除外し、LEFT JOINの効果が失われる
SELECT Customers.CustomerID, Customers.CustFirstName,
  Customers.CustLastName, Orders.OrderNumber, Orders.OrderDate,
  Orders.OrderTotal
FROM Customers LEFT JOIN Orders
  ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN CAST('2015-10-01' AS DATETIME)
  AND CAST('2015-12-31' AS DATETIME);
