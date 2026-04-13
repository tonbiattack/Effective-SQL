-- 【概要】閉包テーブルモデル（Closure Table Model）で階層構造を表現する。EmployeesAncestryテーブルに全ての祖先→子孫ペアとその距離を格納し、任意の階層クエリを効率化する。

CREATE DATABASE Item61Example
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_unicode_ci;

USE Item61Example;

-- 基本的な従業員テーブル（隣接リスト形式で親子関係も保持）
CREATE TABLE Employees (
  EmployeeID int NOT NULL PRIMARY KEY,
  EmpName varchar(255) NOT NULL,
  EmpPosition varchar(255) NOT NULL,
  SupervisorID int NULL
);

-- 閉包テーブル: 全ての祖先-子孫ペアとその階層距離を格納（Distance=0は自己参照）
CREATE TABLE EmployeesAncestry (
  SupervisedEmployeeID int NOT NULL,    -- 子孫（部下）の従業員ID
  SupervisingEmployeeID int NOT NULL,   -- 祖先（上司）の従業員ID
  Distance int NOT NULL,                -- 階層距離（0=自己参照、1=直属上司等）
  PRIMARY KEY (SupervisedEmployeeID, SupervisingEmployeeID)
);

ALTER TABLE Employees 
ADD FOREIGN KEY (SupervisorID) 
REFERENCES Employees (EmployeeID);

ALTER TABLE EmployeesAncestry 
ADD CONSTRAINT FK_EmployeesAncestry_SupervisingEmployeeID
FOREIGN KEY (SupervisingEmployeeID)
REFERENCES Employees (EmployeeID);

ALTER TABLE EmployeesAncestry
ADD CONSTRAINT FK_EmployeesAncestry_SupervisedEmployeeID
FOREIGN KEY (SupervisedEmployeeID)
REFERENCES Employees (EmployeeID);

-- 従業員データを投入
INSERT INTO Employees (EmployeeID, EmpName, EmpPosition, SupervisorID)
VALUES
	(1,	'Amy Kok', 'President', NULL),
	(2, 'Tom LaPlante', 'Manager', 1),
	(3,	'Aliya Ash', 'Manager', 1),
	(4,	'Nya Maeng', 'Associate',2),
	(5, 'Lee Devi', 'Associate', 2),
	(6, 'Kush Itō', 'Associate', 2),
	(7, 'Raj Pavlov', 'Senior Editor', 3),
	(8, 'Kusk Pérez', 'Senior Developer', 3),
	(9, 'Zoha Larsson',	'Senior Writer', 3),
	(10, 'Yuri Lee', 'Developer', 8),
	(11, 'Mariam Davis', 'Developer', 8),
	(12, 'Jessica Yosef', 'Developer', 8)
;

-- 全祖先-子孫ペアをDistance付きで投入（自己参照Distance=0を含む）
INSERT INTO EmployeesAncestry (SupervisedEmployeeID, SupervisingEmployeeID, Distance)
VALUES
	(1, 1, 0),
	(2, 1, 1),
	(2, 2, 0),
	(3, 1, 1),
	(3, 3, 0),
	(4, 1, 2),
	(4, 2, 1),
	(4, 4, 0),
	(5, 1, 2),
	(5, 2, 1),
	(5, 5, 0),
	(6, 1, 2),
	(6, 2, 1),
	(6, 6, 0),
	(7, 1, 2),
	(7, 3, 1),
	(7, 7, 0),
	(8, 1, 2),
	(8, 3, 1),
	(8, 8, 0),
	(9, 1, 2),
	(9, 3, 1),
	(9, 9, 0),
	(10, 1, 3),
	(10, 3, 2),
	(10, 8, 1),
	(10, 10, 0),
	(11, 1, 3),
	(11, 3, 2),
	(11, 8, 1),
	(11, 11, 0),
	(12, 1, 3),
	(12, 3, 2),
	(12, 8, 1),
	(12, 12, 0)
;
