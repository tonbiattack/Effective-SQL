-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】インデックスなしの場合のクエリ実行例。エリアコード530の顧客都市を取得するクエリをインデックス有無で比較するデモ（インデックスなし版）。

USE SalesOrdersSample;

-- エリアコードが530の顧客の都市名を取得（インデックスなし）
SELECT CustCity
FROM Customers
WHERE CustAreaCode = 530;
