-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】UNION ALLとztblSeqNumbers（タリーテーブル）を使用して宛名ラベル用データを生成する。先頭に3行の空白行を追加し、その後に顧客情報をZIPコード順で出力する。

USE SalesOrdersSample;

-- タリーテーブルで3行の空白行を生成（ラベルの上余白用）
SELECT  ' ' AS CustName, ' ' AS CustStreetAddress,
    ' ' AS CustCityState, ' ' AS CustZipCode
FROM ztblSeqNumbers
WHERE Sequence <= 3
UNION ALL
-- 顧客氏名・住所・市区町村・ZIPコードをCONCATで結合して取得
SELECT CONCAT(C.CustFirstName, ' ', C.CustLastName) AS CustName,
    C.CustStreetAddress,
    CONCAT(C.CustCity, ', ', C.CustState, ' ', C.CustZipCode)
       AS CustCityState, C.CustZipCode
FROM Customers AS C
ORDER BY CustZipCode;
