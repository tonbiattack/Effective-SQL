-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】HAVING句のサブクエリで全体平均配送日数を計算し、
--         全体平均より配送日数が多いベンダーを抽出する。
--         非相関サブクエリをHAVINGで使う典型的なパターン。

USE SalesOrdersSample;

-- ベンダーごとの平均配送日数を算出し、全ベンダー平均を超えるものをHAVINGで抽出
SELECT Vendors.VendName,
  AVG(Product_Vendors.DaysToDeliver) AS AvgDelivery
FROM Vendors
  INNER JOIN Product_Vendors
    ON (Vendors.VendorID = Product_Vendors.VendorID)
GROUP BY Vendors.VendName
-- HAVINGのサブクエリで全体の平均配送日数を算出して比較
HAVING AVG(Product_Vendors.DaysToDeliver) >
  (SELECT AVG(DaysToDeliver) FROM Product_Vendors);
