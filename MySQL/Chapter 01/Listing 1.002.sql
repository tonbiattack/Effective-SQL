-- Ensure you've run Item03StructureAndData.sql
-- in the Sample Databases folder in order to run this example.

-- 【概要】Assignments テーブルの Predecessor_1〜5 カラム（横持ち）を
--         UNION で縦持ちに変換し、図面IDと前任者IDの一覧を取得するクエリ

USE Item03Example;

-- Predecessor_1〜5 を UNION で縦方向に展開（NULL は除外）
SELECT ID AS DrawingID, Predecessor_1 AS Predecessor
FROM Assignments WHERE Predecessor_1 IS NOT NULL
UNION
SELECT ID AS DrawingID, Predecessor_2 AS Predecessor
FROM Assignments WHERE Predecessor_2 IS NOT NULL
UNION
SELECT ID AS DrawingID, Predecessor_3 AS Predecessor
FROM Assignments WHERE Predecessor_3 IS NOT NULL
UNION
SELECT ID AS DrawingID, Predecessor_4 AS Predecessor
FROM Assignments WHERE Predecessor_4 IS NOT NULL
UNION
SELECT ID AS DrawingID, Predecessor_5 AS Predecessor
FROM Assignments WHERE Predecessor_5 IS NOT NULL
-- 図面ID・前任者IDの昇順でソート
ORDER BY DrawingID, Predecessor;
