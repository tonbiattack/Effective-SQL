-- Ensure you've run Listing 10.004.sql
-- in order to run this example.

-- 【概要】入れ子集合モデルで指定ノードの全子孫（サブツリー）を取得する。lft>=@lft AND rgt<=@rgtの条件で特定ノード配下の全従業員を効率的に取得する。

USE Item59Example;

-- lft=10, rgt=23のノード（Aliya Ash）のサブツリーを取得するための境界値
SET @lft = 10;
SET @rgt = 23;

-- 入れ子集合モデルで指定範囲内のノード（全子孫）を取得
SELECT e.*
FROM Employees AS e
WHERE e.lft >= @lft
  AND e.rgt <= @rgt;
