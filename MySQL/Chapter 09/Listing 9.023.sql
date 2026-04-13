-- Ensure you've run EntertainmentAgencyStructure.sql
-- and EntertainmentAgencyData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】2015年のエージェント別・月別の契約合計金額を集計する。MONTH()関数でグループ化し、月ごとの契約売上を行形式で取得する（ピボット前の集計ベース）。

USE EntertainmentAgencySample;

-- 2015年の契約についてエージェント・月別に合計契約額を集計
SELECT A.AgtFirstName, A.AgtLastName,
    MONTH(E.StartDate) AS ContractMonth,
    SUM(E.ContractPrice) AS TotalContractValue
FROM Agents AS A INNER JOIN Engagements AS E
  ON A.AgentID = E.AgentID
WHERE YEAR(E.StartDate) = 2015
GROUP BY A.AgtFirstName, A.AgtLastName, MONTH(E.StartDate);
