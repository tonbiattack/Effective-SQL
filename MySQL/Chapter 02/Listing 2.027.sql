-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】大文字小文字を区別する RDBMS 向けに UPPER 関数でそろえてから比較する検索例。
--         MySQL は大文字小文字を区別しないため UPPER は不要だが、
--         他の RDBMS（PostgreSQL 等）では必要になる。

USE SalesOrdersSample;

-- Listing 2.27 Sample SQL for case-sensitive RDBMS
-- (Note that MySQL is case-insensitive, so this is not necessary!)
-- UPPER で大文字化して比較（MySQL では不要だが他の RDBMS 向けの書き方）
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE UPPER(EmpLastName) = 'VIESCAS';

