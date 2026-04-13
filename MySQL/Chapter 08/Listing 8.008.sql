-- Ensure you've run BowlingLeagueStructure.sql
-- and BowlingLeagueData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】CROSS JOINによる自己結合で全チームの対戦組み合わせを生成する。Team2ID > Team1IDの条件で重複を排除し、各ペアを一度だけ取得する。

USE BowlingLeagueSample;

-- TeamsテーブルをCROSS JOINで自己結合し、全ユニークな対戦ペアを生成
SELECT Teams1.TeamID AS Team1ID, Teams1.TeamName AS Team1Name, Teams2.TeamID AS Team2ID, Teams2.TeamName AS Team2Name
FROM Teams AS Teams1 CROSS JOIN Teams AS Teams2
WHERE Teams2.TeamID > Teams1.TeamID
ORDER BY Teams1.TeamID, Teams2.TeamID;
