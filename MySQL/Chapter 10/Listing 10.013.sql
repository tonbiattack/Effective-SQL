-- Ensure you've run Listing 10.010.sql
-- in order to run this example.

-- 【概要】閉包テーブルモデルで葉ノード（部下を持たない末端従業員）を取得する。NOT EXISTSで誰の上司にもなっていない（Distance>0の子孫を持たない）従業員を抽出する。

USE Item61Example;

-- 閉包テーブルにてDistance>0の子孫（部下）が存在しない従業員（葉ノード）を取得
SELECT e.*
FROM Employees AS e
WHERE NOT EXISTS (
  SELECT NULL
  FROM EmployeesAncestry AS a
  WHERE e.EmployeeID = a.SupervisingEmployeeID
    AND a.Distance > 0
);
