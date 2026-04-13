-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】複合インデックスを作成してクエリ性能を向上させるデモ。CustAreaCodeとCustCityの複合インデックスを利用してエリアコード530の顧客都市を効率的に取得する。

USE SalesOrdersSample;

-- CustAreaCode, CustCityの複合インデックスを作成
CREATE INDEX IX_Customers_CustArea
ON Customers (CustAreaCode, CustCity);

-- インデックスを利用してエリアコードが530の顧客都市を取得
SELECT CustCity
FROM Customers
WHERE CustAreaCode = 530;

-- テスト後にインデックスを削除
DROP INDEX IX_Customers_CustArea ON Customers;
