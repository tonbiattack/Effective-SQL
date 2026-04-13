-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】NULLを含むカラムでの検索のノン・サーガブルな悪い例。
--         IFNULL()関数をカラムに適用するとインデックスが無効になる。

USE Item28Example;

-- Listing 4.33 Non-sargable query to find a particular name in a field which can be Null

-- 悪い例: IFNULL()関数をカラムに適用するとインデックスが使用されない
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE IFNULL(EmpLastName, 'Viescas') = 'Viescas';

