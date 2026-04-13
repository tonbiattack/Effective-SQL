
-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】特定日のログを取得する推奨アプローチ。
--         >= 対象日 AND < 翌日 の不等号比較を使うことで、
--         時刻精度に依存せず正確に1日分のレコードを取得できる。

USE Item27Example;

-- Listing 4.26 Recommended approach to list log messages for a specific day

-- 推奨: >= 開始日 AND < 翌日 の不等号範囲指定で時刻精度に依存しない安全なフィルタ
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage
FROM ProgramLogs AS L
WHERE L.LogDate >= CONVERT('2016-07-04', datetime)
AND L.LogDate < CONVERT('2016-07-05', datetime);


