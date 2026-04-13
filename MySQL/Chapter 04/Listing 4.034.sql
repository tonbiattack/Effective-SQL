-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】NULLを含むカラムでの検索のサーガブルな推奨パターン。
--         カラムに関数を適用せず、等値比較とIS NULLをOR条件で組み合わせる。

USE Item28Example;

-- Listing 4.34 Sargable query to find a particular name in a field which can be Null

-- 良い例: 等値比較とIS NULLをOR条件でつなぎインデックスを活用
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpLastName = 'Viescas'
    OR EmpLastName IS NULL;

