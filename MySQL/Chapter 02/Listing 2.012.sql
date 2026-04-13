-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Employees テーブルに (EmpState, EmpCity) の複合インデックス EmpStateName を
--         作成するスクリプト。Listing 2.011 のクエリのパフォーマンス改善を目的とする。

USE SalesOrdersSample;

-- 州・市区町村の複合インデックス（州優先）を作成
CREATE INDEX EmpStateName
	ON Employees
	(EmpState, EmpCity);
