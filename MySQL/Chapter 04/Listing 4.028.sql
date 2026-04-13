-- Create a new database, to make it easier to cleanup afterward.

-- 【概要】サーガブル（インデックス利用可能）なクエリとノン・サーガブルなクエリの
--         比較例示用にItem28ExampleデータベースとEmployeesテーブルを作成する。
--         4.029〜4.037のクエリのベーステーブルとなる。

CREATE DATABASE Item28Example;

USE Item28Example;

-- Listing 4.28 Table and Index creation DDL

-- 各カラムにインデックスを設定（サーガブルクエリ検証用）
CREATE TABLE Employees (
  EmployeeID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  EmpFirstName varchar (25) NULL ,
  EmpLastName varchar (25) NULL ,
  EmpDOB date NULL ,
  EmpSalary decimal (15,2) NULL 
);
CREATE INDEX EmpFirstName ON Employees (EmpFirstName ASC);
CREATE INDEX EmpLastName ON Employees (EmpLastName ASC);
CREATE INDEX EmpDOB ON Employees (EmpDOB ASC);
CREATE INDEX EmpSalary ON Employees (EmpSalary ASC);

