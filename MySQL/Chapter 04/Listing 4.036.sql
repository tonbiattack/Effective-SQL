-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】計算式を含むノン・サーガブルなクエリの悪い例。
--         インデックス付きカラムに演算を適用するとインデックスが無効になる。

USE Item28Example;

-- Listing 4.36 Non-sargable query to find calculated value

-- 悪い例: EmpSalaryに乗算を適用するとEmpSalaryインデックスが使用されない
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpSalary*1.10 > 100000;




