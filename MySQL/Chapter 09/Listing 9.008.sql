-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】クーポン枚数分だけ行を複製して宛名ラベル印刷用データを生成する。ztblSeqNumbersとCROSS JOINしてクーポン枚数分の行を展開し、顧客情報と組み合わせる。

USE SalesOrdersSample;

-- MySQL does not support CTEs so using views
-- 2015年12月の顧客別購入合計を格納するビュー
CREATE VIEW CustDecPurch AS
SELECT Orders.CustomerID, 
   SUM((QuotedPrice)*(QuantityOrdered)) AS Purchase 
 FROM Orders INNER JOIN Order_Details
   ON Orders.OrderNumber = Order_Details.OrderNumber 
 WHERE Orders.OrderDate Between '2015-12-01'
     AND '2015-12-31' 
 GROUP BY Orders.CustomerID;
 
-- 購入額に対応するクーポン枚数を決定するビュー
CREATE VIEW Coupons AS
SELECT CustDecPurch.CustomerID, ztblPurchaseCoupons.NumCoupons
 FROM CustDecPurch CROSS JOIN ztblPurchaseCoupons
 WHERE CustDecPurch.Purchase BETWEEN
   ztblPurchaseCoupons.LowSpend AND
   ztblPurchaseCoupons.HighSpend;

-- ztblSeqNumbersとCROSS JOINし、クーポン枚数分だけ顧客行を複製して宛名ラベル用データを生成
SELECT C.CustFirstName, C.CustLastName, C.CustStreetAddress,
     C.CustCity, C.CustState, C.CustZipCode, CP.NumCoupons
FROM Coupons AS CP INNER JOIN Customers AS C
  ON CP.CustomerID = C.CustomerID
CROSS JOIN ztblSeqNumbers AS z
WHERE z.Sequence <= CP.NumCoupons;

-- 使用したビューを削除してクリーンアップ
DROP VIEW Coupons;
DROP VIEW CustDecPurch;