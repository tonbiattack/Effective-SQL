-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】サーガブルなイニシャル検索の推奨パターン。
--         前方一致LIKE 'S%' はインデックスを利用できるため高速。
--         後方一致や中間一致（%S%）はインデックスが使われないことに注意。

USE Item28Example;

-- Listing 4.32 Sargable query to limit data to a particular initial

-- 良い例: 前方一致LIKEはインデックスを有効活用できる
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpLastName LIKE 'S%';

