-- 【概要】入れ子集合モデル（Nested Sets Model）で階層構造を表現するEmployeesテーブルを作成する。lft/rgt（左辺値・右辺値）で木構造のトラバーサルを効率化する代替アプローチ。

CREATE DATABASE Item59Example
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_unicode_ci;

USE Item59Example;

-- lft（左辺値）とrgt（右辺値）を追加した入れ子集合モデル用のEmployeesテーブル
CREATE TABLE Employees (
  EmployeeID int PRIMARY KEY,
  EmpName varchar(255) NOT NULL,
  EmpPosition varchar(255) NOT NULL,
  SupervisorID int NULL,
  lft int NULL,  -- 入れ子集合の左辺値（サブツリーの範囲左境界）
  rgt int NULL   -- 入れ子集合の右辺値（サブツリーの範囲右境界）
);

-- SupervisorIDを自己参照外部キーとして設定
ALTER TABLE Employees
ADD FOREIGN KEY (SupervisorID)
REFERENCES Employees (EmployeeID);

-- lft/rgt値付きで組織階層データを投入（ルートノードlft=1, rgt=24）
INSERT INTO Employees (EmployeeID, EmpName, EmpPosition, SupervisorID, lft, rgt)
VALUES
	(1,	'Amy Kok', 'President', NULL, 1, 24),
	(2, 'Tom LaPlante', 'Manager', 1, 2, 9),
	(3,	'Aliya Ash', 'Manager', 1, 10, 23),
	(4,	'Nya Maeng', 'Associate', 2, 3, 4),
	(5, 'Lee Devi', 'Associate', 2, 5, 6),
	(6, 'Kush Itō', 'Associate', 2, 7, 8),
	(7, 'Raj Pavlov', 'Senior Editor', 3, 11, 12),
	(8, 'Kusk Pérez', 'Senior Developer', 3, 13, 20),
	(9, 'Zoha Larsson',	'Senior Writer', 3, 21, 22),
	(10, 'Yuri Lee', 'Developer', 8, 14, 15),
	(11, 'Mariam Davis', 'Developer', 8, 16, 17),
	(12, 'Jessica Yosef', 'Developer', 8, 18, 19)
;
