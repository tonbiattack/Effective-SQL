
-- Ensure you've run Listing 9.020.sql and Listing 9.021.sql first
-- to create and populate the Appointments and DimDate tables in the Item56Example database

-- 【概要】DimDateとAppointmentsをLEFT JOINしてカレンダー形式の一覧を生成する。予約のない日も含めた全日付を表示し、予約がある日には詳細情報を付与する。

USE Item56Example;

-- Listing 9.22 SQL statement to return calendar details

-- DimDateを左テーブルとしてLEFT JOIN（予約なしの日はNULL表示）
SELECT D.FullDate,
  A.ApptDescription ,
  A.ApptStartDate ,
  A.ApptStartTime,
  A.ApptEndDate ,
  A.ApptEndTime
FROM DimDate AS D LEFT JOIN Appointments AS A
  ON D.FullDate = A.ApptStartDate
ORDER BY D.FullDate;

