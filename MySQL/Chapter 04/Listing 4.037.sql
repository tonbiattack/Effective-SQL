-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】計算式のサーガブルな推奨パターン。
--         演算を定数側に移すことでカラムを素のまま保ち、インデックスを有効活用する。

USE Item28Example;


-- Listing 4.37 Sargable query to find calculated value

-- 良い例: 演算を右辺（定数側）に移動し、EmpSalaryインデックスを有効活用
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpSalary > 100000/1.10;







