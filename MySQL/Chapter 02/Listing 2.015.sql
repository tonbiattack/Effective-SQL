-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Orders テーブルに (CustomerID, OrderTotal) の複合インデックス CustOrder を
--         作成するスクリプト。Listing 2.014 の GROUP BY 集計クエリの高速化を目的とする。

USE SalesOrdersSample;

-- Listing 2.15 Sample Index creation SQL
-- 顧客ID・注文合計の複合インデックスを作成（GROUP BY + SUM のカバリングインデックス）
CREATE INDEX CustOrder
ON Orders(CustomerID, OrderTotal);
