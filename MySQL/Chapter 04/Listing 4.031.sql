-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】ノン・サーガブルなイニシャル検索の悪い例。
--         Left()関数をカラムに適用するとEmpLastNameインデックスが無効になる。

USE Item28Example;

-- Listing 4.31 Non-sargable query to limit data to a particular initial

-- 悪い例: Left()関数をカラムに適用するとインデックスが使用されない
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE Left(EmpLastName, 1) = 'S';
