-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】HAVING句にサブクエリを使い、全体平均配送日数を超えるベンダーを抽出する。
--         HAVINGのサブクエリで同じ期間の全体平均を計算し、グループ平均と比較する。

USE SalesOrdersSample;

-- ベンダーごとの平均配送日数を算出し、全体平均より遅いベンダーをHAVINGで絞り込む
SELECT V.VendName, AVG(DateDiff(P.DeliveryDate,
    P.OrderDate)) AS DeliveryDays
FROM Vendors AS V
  INNER JOIN PurchaseOrders AS P
     ON V.VendorID = P.VendorID
WHERE P.DeliveryDate IS NOT NULL
  AND P.OrderDate BETWEEN '2015-10-01' AND '2015-12-31'
GROUP BY V.VendName
-- HAVINGのサブクエリで同期間の全体平均配送日数を算出して比較
HAVING AVG(DateDiff(P.DeliveryDate, P.OrderDate)) >
  (SELECT AVG(DateDiff(P2.DeliveryDate, P2.OrderDate))
   FROM PurchaseOrders AS P2
   WHERE P2.DeliveryDate IS NOT NULL
      AND P2.OrderDate BETWEEN '2015-10-01' AND '2015-12-31');
