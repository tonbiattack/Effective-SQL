-- Ensure you've run Listing 10.010.sql
-- in order to run this example.

-- 【概要】閉包テーブルモデルで指定従業員の全部下（子孫ノード）を取得する。EmployeesAncestryのSupervisingEmployeeIDで上司を指定し、Distance>0（自己参照除外）で全部下を取得する。

USE Item61Example;

-- 検索する上司の従業員IDを設定（ID=3: Aliya Ash）
SET @EmployeeID = 3;

-- 閉包テーブルでEmployeeID=3配下の全部下（Distance>0）を取得
SELECT e.*
FROM Employees AS e
INNER JOIN EmployeesAncestry AS a
  ON e.EmployeeID = a.SupervisedEmployeeID
WHERE a.SupervisingEmployeeID = @EmployeeID
  AND a.Distance > 0;
