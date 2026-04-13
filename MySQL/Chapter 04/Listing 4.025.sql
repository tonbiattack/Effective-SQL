-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】特定日のログを取得する試み（第4案）。
--         上限を23:59:59.999に設定してBETWEENを使う方法。
--         精度によっては漏れが生じるリスクがあり、推奨されない。

USE Item27Example;

-- Listing 4.25 Fourth attempt to list log messages for a specific day
-- 問題: ミリ秒精度によっては23:59:59.999を超えたレコードが漏れる可能性がある
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage
FROM ProgramLogs AS L
WHERE L.LogDate BETWEEN CONVERT('2016-07-04', datetime)
                AND CONVERT('2016-07-04 23:59:59.999', datetime);

