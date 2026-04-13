-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】ノン・サーガブル（インデックス非利用）なクエリの例。
--         Year()関数をWHERE句のカラムに適用するとインデックスが使われず
--         フルスキャンが発生する悪いパターン。

USE Item28Example;

-- Listing 4.29 Non-sargable query to limit data to a particular year

-- 悪い例: カラムにYear()関数を適用するとEmpDOBインデックスが使用されない
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE Year(EmpDOB) = 1950;


