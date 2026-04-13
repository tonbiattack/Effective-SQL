-- Ensure you've run EntertainmentAgencyStructure.sql
-- and EntertainmentAgencyData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】ztblQuarters（四半期タリーテーブル）とCROSS JOINを使用して四半期別契約合計をピボット表示する。契約なしのエージェントもLEFT JOINで含めて2015年の四半期別売上を集計する。

USE EntertainmentAgencySample;

-- ztblQuartersとCROSS JOINし、四半期フラグ（Qtr_1st等）を乗算して四半期別売上をピボット集計
SELECT AE.AgtFirstName, AE.AgtLastName, z.YearNumber,
    SUM(AE.ContractPrice * Z.Qtr_1st) AS First_Quarter,
    SUM(AE.ContractPrice * Z.Qtr_2nd) AS Second_Quarter,
    SUM(AE.ContractPrice * Z.Qtr_3rd) AS Third_Quarter,
    SUM(AE.ContractPrice * Z.Qtr_4th) AS Fourth_Quarter
FROM ztblQuarters AS Z CROSS JOIN
  (SELECT A.AgtFirstName, A.AgtLastName,
       E.StartDate, E.ContractPrice
   FROM Agents AS A LEFT JOIN Engagements AS E
    ON A.AgentID = E.AgentID) AS AE
WHERE (AE.StartDate BETWEEN Z.QuarterStart AND Z.QuarterEnd)
   OR (AE.StartDate IS NULL AND Z.YearNumber = 2015)
GROUP BY AgtFirstName, AgtLastName, YearNumber;