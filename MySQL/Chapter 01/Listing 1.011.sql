-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Orders テーブル定義の参考例。CustomerID カラムにインライン FOREIGN KEY 構文で
--         Customers テーブルへの参照制約（Orders_FK98）を直接記述している。
--         既存テーブルと重複するためコメントアウト済み。

USE SalesOrdersSample;

-- The Orders table already exists, so you will get an
--  error if you try to run the following.
-- Included as comments for reference.
-- CREATE TABLE Orders (
--   OrderNumber int NOT NULL PRIMARY KEY ,
--   OrderDate date NULL ,
--   ShipDate date NULL ,
--   CustomerID int NOT NULL DEFAULT 0 
--   	CONSTRAINT Orders_FK98 FOREIGN KEY 
--   	REFERENCES Customers ( CustomerID ),
--   EmployeeID int NULL DEFAULT 0 ,
--   OrderTotal decimal (15,2) NULL DEFAULT 0 );

