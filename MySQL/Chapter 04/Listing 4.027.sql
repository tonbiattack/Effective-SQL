-- Ensure you've run Listing 4.021.sql to create the ProgramLogs table

-- 【概要】Listing 4.26をパラメータ化したバージョン。
--         ユーザー変数に開始日と終了日をセットし、INTERVAL 1 DAYで翌日を動的に計算。
--         再利用しやすい安全な日付範囲フィルタのベストプラクティス。

USE Item27Example;

-- Listing 4.27 Paramterized version of Listing 4.26
-- 開始日・終了日をユーザー変数で指定（パラメータ化による再利用性向上）
SET @startDate = DATE '2016-07-04';
SET @endDate = DATE '2016-07-04';

-- INTERVAL 1 DAYで終了日の翌日を動的算出し、<演算子で安全に上限を設定
SELECT L.LogUserID, L.Logger, L.LogLevel, L.LogMessage, L.LogDate
FROM ProgramLogs AS L
WHERE L.LogDate >= @startDate
  AND L.LogDate < (@endDate + INTERVAL 1 DAY);  