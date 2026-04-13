-- Ensure you've run Listing 10.001.sql
-- in order to run this example.

-- 【概要】隣接リストモデルの組織ツリーで親子関係を変更する。EmployeeID=4の上司をID=5に、EmployeeID=2の上司をID=3に変更して組織再編を表現する。

USE Item58Example;

-- 組織変更: 従業員ID=4の上司をID=5に変更
UPDATE Employees SET SupervisorID = 5 WHERE EmployeeID = 4;
-- 組織変更: 従業員ID=2の上司をID=3に変更
UPDATE Employees SET SupervisorID = 3 WHERE EmployeeID = 2;
