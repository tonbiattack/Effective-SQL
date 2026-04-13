-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】5.008の改善版。WHERE句で集計前に日付フィルタを行い、
--         必要な行だけをGROUP BYで集計する効率的なパターン。

USE SalesOrdersSample;

-- 良い例: WHERE句で先に日付フィルタし、絞り込み後の行のみをGROUP BYで集計
SELECT Orders.ShipDate, SUM(Orders.OrderTotal) AS SumOfOrderTotal
FROM Orders
WHERE Orders.ShipDate >= '2015-09-01' AND Orders.ShipDate < '2015-10-01'
GROUP BY Orders.ShipDate;
