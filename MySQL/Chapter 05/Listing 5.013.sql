-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】複数の非集計列とEXTRACT関数を含むGROUP BYの例。
--         都市・州・郵便番号・年月・担当従業員ごとに注文を集計する。
--         EXTRACT関数はGROUP BY句にも同様に記述が必要。

USE SalesOrdersSample;

-- 都市・州・郵便番号・年月・担当者の多軸集計
SELECT c.CustCity, c.CustState, c.CustZipCode,
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
  EmployeeID,
  MAX(o.OrderDate) AS LastOrderDate, COUNT(o.OrderNumber) AS OrderCount,
  SUM(o.OrderTotal) AS TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
  ON c.CustomerID = o.CustomerID
GROUP BY CustCity, CustState, CustZipCode,
  EXTRACT(YEAR FROM OrderDate), EXTRACT(MONTH FROM OrderDate), EmployeeID;