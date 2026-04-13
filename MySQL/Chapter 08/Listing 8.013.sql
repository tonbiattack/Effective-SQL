-- Ensure you've run EntertainmentAgencyStructure.sql
-- and EntertainmentAgencyData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】顧客の上位2つの音楽嗜好とエンターテイナーの上位2スタイル強度をビューでピボット化し、嗜好順序が一致（同順・逆順どちらも可）するペアを取得する。

USE EntertainmentAgencySample;

-- MySQL does not support CTEs so using views instead.

-- 顧客の音楽嗜好をピボット化（第1・第2・第3希望のStyleIDを列として展開）
CREATE VIEW CustPreferences AS
SELECT C.CustomerID, C.CustFirstName, C.CustLastName, 
       MAX((CASE WHEN MP.PreferenceSeq = 1  
                 THEN MP.StyleID 
                 ELSE Null END)) AS FirstPreference,
       MAX((CASE WHEN MP.PreferenceSeq = 2  
                 THEN MP.StyleID 
                 ELSE Null END)) AS SecondPreference,
       MAX((CASE WHEN MP.PreferenceSeq = 3  
                 THEN MP.StyleID 
                 ELSE Null END)) AS ThirdPreference
FROM Musical_Preferences AS MP INNER JOIN Customers AS C
  ON MP.CustomerID = C.CustomerID 
GROUP BY C.CustomerID, C.CustFirstName, C.CustLastName;

-- エンターテイナーのスタイル強度をピボット化（強度1・2・3のStyleIDを列として展開）
CREATE VIEW EntStrengths AS
SELECT E.EntertainerID, E.EntStageName, 
       MAX((CASE WHEN ES.StyleStrength = 1 
                 THEN ES.StyleID 
                 ELSE Null END)) AS FirstStrength, 
       MAX((CASE WHEN ES.StyleStrength = 2 
                 THEN ES.StyleID 
                 ELSE Null END)) AS SecondStrength, 
       MAX((CASE WHEN ES.StyleStrength = 3 
                 THEN ES.StyleID 
                 ELSE Null END)) AS ThirdStrength 
FROM Entertainer_Styles AS ES
INNER JOIN Entertainers AS E
  ON ES.EntertainerID = E.EntertainerID 
GROUP BY E.EntertainerID, E.EntStageName;

-- CROSS JOINで全顧客×全エンターテイナーの組み合わせを生成し、嗜好とスタイル強度が一致するペアを抽出
SELECT CustomerID, CustFirstName, CustLastName,
   EntertainerID, EntStageName
FROM CustPreferences CROSS JOIN EntStrengths
WHERE (FirstPreference = FirstStrength
       AND SecondPreference = SecondStrength)
   OR (SecondPreference = FirstStrength
       AND FirstPreference = SecondStrength)
ORDER BY CustomerID;

-- 使用したビューを削除してクリーンアップ
DROP VIEW EntStrengths;
DROP VIEW CustPreferences;