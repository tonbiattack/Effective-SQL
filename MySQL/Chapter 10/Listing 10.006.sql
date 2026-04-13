-- Ensure you've run Listing 10.004.sql
-- in order to run this example.

-- 【概要】入れ子集合モデルで指定ノードの全祖先（ルートまでのパス）を取得する。lft<=@lft AND rgt>=@rgtの条件で指定ノードを包含する全親ノードを効率的に取得する。

USE Item59Example;

-- lft=10, rgt=23のノード（Aliya Ash）の祖先を取得するための境界値
SET @lft = 10;
SET @rgt = 23;

-- 指定ノードを内包する（lft以下かつrgt以上の）全祖先ノードを取得
SELECT *
FROM Employees AS e
WHERE e.lft <= @lft
  AND e.rgt >= @rgt
;