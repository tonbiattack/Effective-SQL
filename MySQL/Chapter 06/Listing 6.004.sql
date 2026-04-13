-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】担当従業員と同州の顧客一覧に、その顧客から注文を受けたかどうかのステータスを
--         CASE式＋相関サブクエリで付加する。同州の全顧客を取得しつつ担当注文を判定する。

USE SalesOrdersSample;

-- 従業員と同州の顧客を結合し、担当顧客かどうかをCASE+サブクエリで判定
SELECT Employees.EmpFirstName, Employees.EmpLastName,
  Customers.CustFirstName, Customers.CustLastName,
  Customers.CustAreaCode, Customers.CustPhoneNumber,
  -- この顧客がこの従業員に注文したことがあるか判定
  (CASE WHEN Customers.CustomerID IN
    (SELECT CustomerID
     FROM Orders
     WHERE Orders.EmployeeID = Employees.EmployeeID)
        THEN 'Ordered from you.'
        ELSE ' ' END) AS CustStatus
FROM Employees
  INNER JOIN Customers
    ON Employees.EmpState = Customers.CustState;
