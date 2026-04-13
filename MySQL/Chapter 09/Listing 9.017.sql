-- Ensure you've run Item55StructureAndData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】DimDateテーブルにDateValue・WeekdayNameLong・MonthSeqNoの複合インデックスを作成する。月シーケンス番号によるWHERE絞り込みもカバーする改良版インデックス。

USE Item55Example;

-- DateValue・WeekdayNameLong・MonthSeqNoの複合インデックスを作成（SELECT列とWHERE列の両方をカバー）
CREATE INDEX DimDate_WeekDayLong_MonthSeqNo
ON DimDate (DateValue, WeekdayNameLong, MonthSeqNo);
