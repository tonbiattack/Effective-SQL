-- Ensure you've run Item55StructureAndData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】DimDateテーブルにMonthSeqNoを先頭に持つ複合インデックスを作成する。WHERE句のMonthSeqNoによる絞り込みを先頭キーとすることで最も効率的なインデックス設計の例。

USE Item55Example;

-- MonthSeqNo（WHERE条件）を先頭キーにした最適な複合インデックスを作成
CREATE INDEX DimDate_MonthSeqNo
ON DimDate (MonthSeqNo, DateValue, WeekdayNameLong);
