-- Ensure you've run Listing 10.007.sql
-- in order to run this example.

-- 【概要】パス列挙モデルで指定ノードの全祖先を取得する。LOCATE関数でノードIDがパス文字列に含まれるかを検査し、指定パス'/1/2/5'上の全祖先ノードを取得する。

USE Item60Example;

-- 従業員ID=5のノード（Lee Devi）へのフルパスを祖先検索の基準として設定
SET @Nodepath = '/1/2/5' COLLATE utf8_unicode_ci;

-- 各従業員IDが@NodePathの中に含まれるか（LOCATE）で祖先ノードを検出
SELECT e.*
FROM Employees AS e
WHERE LOCATE(CONCAT('/', e.EmployeeID, '/'), @NodePath) > 0;
