-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】日付関数のみを使用して過去2ヶ月間の注文について注文日・出荷日の曜日とリードタイムを取得する。DimDateテーブルを使わず日付演算だけで期間を動的に計算する例。

USE SalesOrdersSample;

-- 過去2ヶ月分の注文について注文日曜日・出荷日曜日・配送リードタイムを取得
-- MAKEDATE/DATE_ADD/DAYOFYEARで今月1日から2ヶ月前の期間を動的に計算
SELECT DAYNAME(o.OrderDate) AS OrderDateWeekDay,
  o.OrderDate,
  DAYNAME(o.ShipDate) AS ShipDateWeekDay,
  o.ShipDate,
  DATEDIFF(o.OrderDate, o.ShipDate) AS DeliveryLead
FROM Orders AS o
WHERE o.OrderDate >=
	DATE_ADD(MAKEDATE(YEAR(CURRENT_DATE()), DAYOFYEAR(CURRENT_DATE() - (DAY(CURRENT_DATE() -1)))), INTERVAL -2 MONTH)
  AND o.OrderDate < MAKEDATE(YEAR(CURRENT_DATE()), DAYOFYEAR(CURRENT_DATE() - (DAY(CURRENT_DATE() -1))))
;