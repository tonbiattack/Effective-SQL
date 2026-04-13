-- While this CREATE FUNCTION statement does not depend on the existence of
-- specific tables, it's meant to be used with the Sales Orders sample database,
-- so you should run SalesOrdersStructure.sql (and SalesOrdersData.sql)
-- in the Sample Databases folder before running this example.

-- 【概要】生年月日から現在の年齢（整数）を計算する非確定的（non-deterministic）な
--         スカラー関数 CalculateAge を作成する。
--         CURRENT_DATE を使用するため実行日によって結果が変わる。

USE SalesOrdersSample;

-- Listing 2.29 Non-deterministic function
-- DATEDIFF で生年月日から経過日数を求め 365 で割って年齢を算出
CREATE FUNCTION CalculateAge(Date_of_Birth date)
RETURNS int
RETURN (DATEDIFF(CURRENT_DATE, Date_of_Birth) / 365);

-- Execute the following only if you do not intend
--  to run Listing 2.030.
-- DROP FUNCTION CalculateAge;