-- Ensure you've run BowlingLeagueStructure.sql
-- and BowlingLeagueData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】INNER JOINによる自己結合で全チームの対戦組み合わせを生成する。Listing 8.8のCROSS JOINと同等の結果をINNER JOIN構文で実現する比較例。

USE BowlingLeagueSample;

-- INNER JOINで自己結合し、Team2ID > Team1IDの条件で全ユニークな対戦ペアを生成
SELECT Teams1.TeamID AS Team1ID, Teams1.TeamName AS Team1Name, Teams2.TeamID AS Team2ID, Teams2.TeamName AS Team2Name
FROM Teams AS Teams1 INNER JOIN Teams AS Teams2
   ON Teams2.TeamID > Teams1.TeamID
ORDER BY Teams1.TeamID, Teams2.TeamID;
