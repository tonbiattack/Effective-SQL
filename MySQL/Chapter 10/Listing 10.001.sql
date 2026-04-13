-- 【概要】隣接リストモデルで階層構造（組織ツリー）を表現するEmployeesテーブルを作成する。SupervisorIDが親ノードを参照する自己参照外部キーで木構造を定義する。

CREATE DATABASE Item58Example
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_unicode_ci;

USE Item58Example;

-- 従業員ID・氏名・役職・上司IDを持つ自己参照テーブル（隣接リストモデル）
CREATE TABLE Employees (
  EmployeeID int PRIMARY KEY,
  EmpName varchar(255) NOT NULL,
  EmpPosition varchar(255) NOT NULL,
  SupervisorID int NULL
);

-- SupervisorIDを自己参照外部キーとして設定（親ノードへの参照）
ALTER TABLE Employees
ADD FOREIGN KEY (SupervisorID)
REFERENCES Employees (EmployeeID);

-- 組織階層データを投入（社長→マネージャー→部下の3階層構造）
INSERT INTO Employees (EmployeeID, EmpName, EmpPosition, SupervisorID)
VALUES
	(1,	'Amy Kok', 'President', NULL),
	(2, 'Tom LaPlante', 'Manager', 1),
	(3,	'Aliya Ash', 'Manager', 1),
	(4,	'Nya Maeng', 'Associate', 2),
	(5, 'Lee Devi', 'Associate', 2),
	(6, 'Kush Itō', 'Associate', 2),
	(7, 'Raj Pavlov', 'Senior Editor', 3),
	(8, 'Kusk Pérez', 'Senior Developer', 3),
	(9, 'Zoha Larsson',	'Senior Writer', 3),
	(10, 'Yuri Lee', 'Developer', 8),
	(11, 'Mariam Davis', 'Developer', 8),
	(12, 'Jessica Yosef', 'Developer', 8)
;
