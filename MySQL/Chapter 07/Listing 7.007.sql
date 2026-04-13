-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】EXPLAINを使用してMySQLの実行計画を確認する。顧客ごとの注文合計を集計するクエリのインデックス使用状況を分析する。

USE SalesOrdersSample;

-- Listing 7.7 Creating an Execution Plan in MySQL

-- 実行計画を表示: CustomerIDごとの注文合計を集計するクエリのコスト分析
EXPLAIN SELECT CustomerID, Sum(OrderTotal)
FROM Orders
GROUP BY CustomerID;