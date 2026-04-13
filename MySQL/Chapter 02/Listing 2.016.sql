-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】OrderDate による WHERE 絞り込みを行い、CustomerID 別に
--         注文合計額を GROUP BY で集計するクエリ。
--         インデックスの選択戦略（WHERE 列 vs GROUP BY 列）を示す例。

USE SalesOrdersSample;

-- Listing 2.16 Sample query SQL with WHERE clause
-- 2015-12-01 以降の注文に限定して顧客別合計を集計
SELECT CustomerID, Sum(OrderTotal) AS SumOrderTotal
FROM Orders
WHERE OrderDate > '2015-12-01'  -- 日付フィルタで対象レコードを絞り込み
GROUP BY CustomerID;