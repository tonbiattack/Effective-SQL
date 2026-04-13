-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】HAVING句を使った日付フィルタリングの悪い例。
--         HAVINGは集計後にフィルタするため、全件GROUP BYした後に絞り込まれ非効率。
--         フィルタはWHERE句で集計前に行うべき（5.009参照）。

USE SalesOrdersSample;

-- 悪い例: HAVING句で日付絞り込みをすると全件集計後にフィルタされ非効率
SELECT Orders.ShipDate, SUM(Orders.OrderTotal) AS SumOfOrderTotal
FROM Orders
GROUP BY Orders.ShipDate
HAVING Orders.ShipDate >= '2015-09-01'
   AND Orders.ShipDate < '2015-10-01';