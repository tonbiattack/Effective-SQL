-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】2015年12月の顧客別購入合計をビューで定義して取得する。CTEの代替としてビューを使用するMySQL向けの実装例。

USE SalesOrdersSample;

-- MySQL does not support CTE, using view.
-- 2015年12月の顧客別購入合計を格納するビュー
CREATE VIEW CustDecPurch AS
SELECT Orders.CustomerID, 
   SUM((QuotedPrice)*(QuantityOrdered)) AS Purchase 
 FROM Orders INNER JOIN Order_Details
   ON Orders.OrderNumber = Order_Details.OrderNumber 
 WHERE Orders.OrderDate Between '2015-12-01'
     AND '2015-12-31' 
 GROUP BY Orders.CustomerID;

-- ビューの内容（12月購入合計）を全件取得
SELECT * FROM CustDecPurch;

-- 使用後にビューを削除
DROP VIEW CustDecPurch;