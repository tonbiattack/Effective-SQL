-- Ensure you've run Item55StructureAndData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】DimDateテーブルにDateValueとWeekdayNameLongの複合インデックスを作成する。日付値と曜日名を同時に検索するクエリのパフォーマンス改善用インデックス（MonthSeqNoなし版）。

USE Item55Example;

-- DateValue（結合キー）とWeekdayNameLong（SELECT列）の複合インデックスを作成
CREATE INDEX DimDate_WeekDayLong
ON DimDate (DateValue, WeekdayNameLong);
