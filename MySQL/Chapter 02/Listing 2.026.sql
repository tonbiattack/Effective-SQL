-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】MySQL は大文字小文字を区別しないため、UPPER 関数なしで
--         そのまま文字列比較できる検索例。インデックスも有効に活用される。

USE SalesOrdersSample;


-- Listing 2.26 Sample SQL for case-insensitive RDBMS
-- (Note that MySQL is case-insensitive)
-- MySQL では大文字小文字を区別しないため、このままインデックスが利用可能
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpLastName = 'Viescas';