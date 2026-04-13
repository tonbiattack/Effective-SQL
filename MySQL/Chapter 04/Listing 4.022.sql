
-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】特定日のログを取得する試み（第1案）。
--         CAST('7/4/2016' AS datetime)はdatetime型との完全一致比較のため、
--         時刻成分を持つレコードが取得できず意図通りに動作しない悪い例。

USE Item27Example;

-- Listing 4.22 First attempt to list log messages for a specific day

-- 問題: datetimeの完全一致比較のため時刻付きレコードが取得されない
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage
FROM ProgramLogs AS L
WHERE L.LogDate = CAST('7/4/2016' AS datetime);

