
-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】特定日のログを取得する試み（第2案）。
--         CONVERT関数でISO形式に変更したが、やはり完全一致比較のため
--         時刻成分があるレコードは取得できない悪い例。

USE Item27Example;

-- Listing 4.23 Second attempt to list log messages for a specific day

-- 問題: CONVERT使用でも完全一致比較のため時刻付きレコードが取得されない
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage
FROM ProgramLogs AS L
WHERE L.LogDate = CONVERT('2016-07-04', datetime);


