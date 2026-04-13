-- Ensure you've run SalesOrdersStructureData.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】OrdersテーブルにOrderDateとShipDateの複合インデックスを作成する。DimDateを使ったリードタイム計算クエリのパフォーマンス改善用。

USE SalesOrdersSample;

-- OrderDateとShipDateの複合インデックスを作成（DimDateとの結合クエリを最適化）
CREATE INDEX Orders_OrderDate_ShipDate
ON Orders (OrderDate, ShipDate);
