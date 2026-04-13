-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】12月の購入額に基づいてクーポン枚数を決定する。ztblPurchaseCoupons（購入金額スラブ対応クーポンテーブル）とCROSS JOINして各顧客のクーポン枚数を取得する。

USE SalesOrdersSample;

-- MySQL does not support CTEs so using view instead
-- 2015年12月の顧客別購入合計を格納するビュー
CREATE VIEW CustDecPurch AS
SELECT Orders.CustomerID, 
   SUM((QuotedPrice)*(QuantityOrdered)) AS Purchase 
 FROM Orders INNER JOIN Order_Details
   ON Orders.OrderNumber = Order_Details.OrderNumber 
 WHERE Orders.OrderDate Between '2015-12-01'
     AND '2015-12-31' 
 GROUP BY Orders.CustomerID;
 
-- 購入額とクーポンスラブテーブルをCROSS JOINし、購入額が範囲内に入るクーポン枚数を決定するビュー
CREATE VIEW Coupons AS
SELECT CustDecPurch.CustomerID, ztblPurchaseCoupons.NumCoupons
FROM CustDecPurch CROSS JOIN ztblPurchaseCoupons
WHERE CustDecPurch.Purchase BETWEEN
   ztblPurchaseCoupons.LowSpend AND
   ztblPurchaseCoupons.HighSpend;

-- 各顧客に付与されるクーポン枚数を取得
SELECT * FROM Coupons;

-- 使用したビューを削除してクリーンアップ
DROP VIEW Coupons;
DROP VIEW CustDecPurch;
 