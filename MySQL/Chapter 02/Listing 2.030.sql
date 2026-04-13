-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Listing 2.029 で作成した CalculateAge 関数を使用し、
--         年齢が50歳を超える従業員を Employees テーブルから取得するクエリ。

USE SalesOrdersSample;

-- Ensure you've run Listing 2.029.sql to create the CalculateAge function

-- Listing 2.30 SQL statement using CalculateAge function
-- CalculateAge で算出した年齢をSELECTし、50歳超を条件にWHEREで絞り込み
SELECT EmployeeID, EmpFirstName, EmpLastName, CalculateAge(EmpDOB) AS EmpAge
  FROM Employees
WHERE CalculateAge(EmpDOB) > 50;  -- 年齢 > 50 の従業員のみ取得

-- Run the following if you do not wish to keep the function in the database.
-- DROP FUNCTION CalculateAge;

