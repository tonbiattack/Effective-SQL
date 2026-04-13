-- Ensure you've run Listing 10.001.sql
-- in order to run this example.

-- 【概要】自己結合を3段重ねて従業員・上司・上司の上司を一度に取得する。隣接リストモデルで2レベル上位の階層まで参照する例（MySQLはCTE再帰非対応のため固定回数の自己結合で対応）。

USE Item58Example;

-- 3回のLEFT JOINで従業員→上司→上司の上司を取得（階層を固定回数の自己結合でトラバース）
SELECT e1.EmpName AS Employee, e2.EmpName AS Supervisor,
       e3.EmpName AS SupverisorsSupervsior
FROM Employees AS e1
LEFT JOIN Employees AS e2 ON e1.SupervisorID = e2.EmployeeID
LEFT JOIN Employees AS e3 ON e2.SupervisorID = e3.EmployeeID;
