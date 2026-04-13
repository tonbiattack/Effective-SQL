-- Ensure you've run Item02StructureAndData.sql
-- in the Sample Databases folder in order to run this example.

-- 【概要】SalesTransactions / Customers / Employees / AutomobileModels を
--         INNER JOIN で結合し、販売ID・顧客情報・購入日・車種・担当者を取得するクエリ

USE Item02Example;

-- 販売情報を4テーブルの内部結合で取得
SELECT st.SalesID, c.CustFirstName, c.CustLastName, c.Address,
  c.City, c.Phone, st.PurchaseDate, m.ModelYear, m.Model,
  e.SalesPerson
FROM SalesTransactions st
  -- 顧客情報を結合
  INNER JOIN Customers c
    ON c.CustomerID = st.CustomerID
  -- 担当営業員情報を結合
  INNER JOIN Employees e
    ON e.EmployeeID = st.SalesPersonID
  -- 車種情報を結合
  INNER JOIN AutomobileModels m
    ON m.ModelID = st.ModelID;