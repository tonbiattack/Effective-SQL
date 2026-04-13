
-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】特定日のログを取得する試み（第3案）。
--         BETWEENで翌日を上限にしたが、2016-07-05の00:00:00も含まれてしまう不正確な例。

USE Item27Example;

-- Listing 4.24 Third attempt to list log messages for a specific day
-- 問題: 上限に翌日の00:00:00が含まれてしまう（BETWEEN境界値の問題）
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage
FROM ProgramLogs AS L
WHERE L.LogDate BETWEEN CONVERT('2016-07-04', datetime)
                AND CONVERT('2016-07-05', datetime);

