-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】EmpState = 'WA' かつ EmpCity に 'ELLE' を含む従業員を
--         Employees テーブルから取得するクエリ（複合インデックスの効果確認用）

USE SalesOrdersSample;

-- Listing 2.11 Sample query SQL
-- 州と市区町村の複合条件で従業員を絞り込む（LIKE の前方一致以外はインデックス非効率）
SELECT EmployeeID, EmpFirstName, EmpLastName
FROM Employees
WHERE EmpState = 'WA'         -- 州コードで絞り込み
AND EmpCity LIKE '%ELLE%';    -- 市名の部分一致検索