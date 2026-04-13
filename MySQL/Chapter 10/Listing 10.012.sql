-- Ensure you've run Listing 10.010.sql
-- in order to run this example.

-- 【概要】閉包テーブルモデルで指定従業員の全上司（祖先ノード）を取得する。EmployeesAncestryのSupervisedEmployeeIDで部下を指定し、Distance>0で全上位階層の上司を取得する。

USE Item61Example;

-- 検索する部下の従業員IDを設定（ID=3: Aliya Ash）
SET @EmployeeID = 3;

-- 閉包テーブルでEmployeeID=3の全上司（Distance>0の全祖先）を取得
SELECT e.*
FROM Employees AS e
INNER JOIN EmployeesAncestry AS a
  ON e.EmployeeID = a.SupervisingEmployeeID
WHERE a.SupervisedEmployeeID = @EmployeeID
  AND a.Distance > 0;
