-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】4.034のOR条件をUNION ALLで書き換えたより改善されたサーガブルパターン。
--         OR条件よりUNION ALLの方が最適化されやすい場合がある。

USE Item28Example;


-- Listing 4.35 Improved sargable query to find a particular name in a field which can be Null

-- 改良例: OR条件をUNION ALLで書き換えることで最適化が改善される場合がある
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpLastName = 'Viescas'
UNION ALL
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpLastName IS NULL;

