-- Ensure you've run Item55StructureAndData.sql, SalesOrdersStructureData.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】DimDate（日付ディメンションテーブル）を使用して先月の注文の曜日名とリードタイムを取得する。Listing 9.13の日付関数版と比較して可読性とパフォーマンスの改善例を示す。

USE SalesOrdersSample;

-- DimDateにINNER JOINして注文日・出荷日の曜日名を取得
-- MonthSeqNo（月シーケンス番号）で先月の注文に絞り込み
-- DateKeyの差分でリードタイムを計算（日付演算不要）
SELECT od.WeekDayNameLong AS OrderDateWeekDay,
  o.OrderDate,
  sd.WeekDayNameLong AS ShipDateWeekDay,
  o.ShipDate,
  sd.DateKey - od.DateKey AS DeliveryLead
FROM Orders AS o
INNER JOIN Item55Example.DimDate AS od
  ON o.OrderDate = od.DateValue
INNER JOIN Item55Example.DimDate AS sd
  ON o.ShipDate = sd.DateValue
INNER JOIN Item55Example.DimDate AS td
  ON td.DateValue = CAST(CURRENT_DATE() AS date)
WHERE od.MonthSeqNo = (td.MonthSeqNo - 1);
