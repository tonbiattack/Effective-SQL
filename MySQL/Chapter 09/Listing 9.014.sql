-- Ensure you've run Item55StructureAndData.sql
-- in the Sample Databases folder
-- in order to run this example.

-- 【概要】日付ディメンションテーブル（DimDate）の定義を示す。年・四半期・月・週・曜日など多様な日付属性を持つ包括的な日付管理テーブル（Item55StructureAndDataで既に作成済み）。

USE Item55Example;

-- NOTE: This is already created if you run the Item55StructureAndData in the sample database folder.

-- 日付に関する多様な属性（曜日名・ISO週番号・各週の開始終了日等）を持つ日付ディメンションテーブル
CREATE TABLE DimDate (
  DateKey int NOT NULL,
  DateValue date NOT NULL PRIMARY KEY,
  NextDayValue date NOT NULL,
  YearValue smallint NOT NULL,
  YearQuarter int NOT NULL,
  YearMonth int NOT NULL,
  YearDayOfYear int NOT NULL,
  QuarterValue tinyint NOT NULL,
  MonthValue tinyint NOT NULL,
  DayOfYear smallint NOT NULL,
  DayOfMonth smallint NOT NULL,
  DayOfWeek tinyint NOT NULL,
  YearName varchar(4) NOT NULL,
  YearQuarterName varchar(7) NOT NULL,
  QuarterName varchar(8) NOT NULL,
  MonthName varchar(3) NOT NULL,
  MonthNameLong varchar(9) NOT NULL,
  WeekdayName varchar(3) NOT NULL,
  WeekDayNameLong varchar(9) NOT NULL,
  StartOfYearDate date NOT NULL,
  EndOfYearDate date NOT NULL,
  StartOfQuarterDate date NOT NULL,
  EndOfQuarterDate date NOT NULL,
  StartOfMonthDate date NOT NULL,
  EndOfMonthDate date NOT NULL,
  StartOfWeekStartingSunDate date NOT NULL,
  EndOfWeekStartingSunDate date NOT NULL,
  StartOfWeekStartingMonDate date NOT NULL,
  EndOfWeekStartingMonDate date NOT NULL,
  StartOfWeekStartingTueDate date NOT NULL,
  EndOfWeekStartingTueDate date NOT NULL,
  StartOfWeekStartingWedDate date NOT NULL,
  EndOfWeekStartingWedDate date NOT NULL,
  StartOfWeekStartingThuDate date NOT NULL,
  EndOfWeekStartingThuDate date NOT NULL,
  StartOfWeekStartingFriDate date NOT NULL,
  EndOfWeekStartingFriDate date NOT NULL,
  StartOfWeekStartingSatDate date NOT NULL,
  EndOfWeekStartingSatDate date NOT NULL,
  QuarterSeqNo int NOT NULL,
  MonthSeqNo int NOT NULL,
  WeekStartingSunSeq int NOT NULL,
  WeekStartingMonSeq int NOT NULL,
  WeekStartingTueSeq int NOT NULL,
  WeekStartingWedSeq int NOT NULL,
  WeekStartingThuSeq int NOT NULL,
  WeekStartingFriSeq int NOT NULL,
  WeekStartingSatSeq int NOT NULL,
  JulianDate int NOT NULL,
  ModifiedJulianDate int NOT NULL,
  ISODate varchar(10) NOT NULL,
  ISOYearWeekNo int NOT NULL,
  ISOWeekNo smallint NOT NULL,
  ISODayOfWeek tinyint NOT NULL,
  ISOYearWeekName varchar(8) NOT NULL,
  ISOYearWeekDayOfWeekName varchar(10) NOT NULL
);