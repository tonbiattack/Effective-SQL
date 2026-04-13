-- Ensure you've run Item18StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】Assignments テーブルから vDrawings（図面一覧）と vPredecessors（前任者一覧）の
--         2つのビューを作成する。vPredecessors は Predecessor_1〜5 を UNION で縦持ちに変換。

USE Item18Example;

-- 図面IDと図面番号のビュー
CREATE VIEW vDrawings AS
SELECT a.ID AS DrawingID, a.DrawingNumber
FROM Assignments AS a;

-- Predecessor_1〜5 を UNION で縦方向に展開し、前任者IDを連番付きで取得するビュー
CREATE VIEW vPredecessors AS
SELECT 1 AS PredecessorID, a.ID AS DrawingID, a.Predecessor_1 AS Predecessor
FROM Assignments AS a
WHERE a.Predecessor_1 IS NOT NULL
UNION
SELECT 2, a.ID, a.Predecessor_2
FROM Assignments AS a
WHERE a.Predecessor_2 IS NOT NULL
UNION
SELECT 3, a.ID, a.Predecessor_3
FROM Assignments AS a
WHERE a.Predecessor_3 IS NOT NULL
UNION
SELECT 4, a.ID, a.Predecessor_4
FROM Assignments AS a
WHERE a.Predecessor_4 IS NOT NULL
UNION
SELECT 5, a.ID, a.Predecessor_5
FROM Assignments AS a
WHERE a.Predecessor_5 IS NOT NULL;

