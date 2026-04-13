-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Orders テーブルに外部キー制約 Orders_FK99（CustomerID → Customers）を
--         ALTER TABLE で追加するスクリプト。既存の制約と重複するため注意。

USE SalesOrdersSample;

-- The Orders table already exists, so you will get an
--  error if you try to run the following.
-- Included as comments for reference.
-- CREATE TABLE Orders (
--   OrderNumber int NOT NULL PRIMARY KEY ,
--   OrderDate date NULL ,
--   ShipDate date NULL ,
--   CustomerID int NOT NULL DEFAULT 0 ,
--   EmployeeID int NULL DEFAULT 0 ,
--   OrderTotal decimal (15,2) NULL DEFAULT 0 );
  
-- A constraint already exists between Customers and
-- Orders but has a different name. This will create a
-- duplicate constraint.
-- CustomerID を外部キーとして Customers テーブルを参照する制約を追加
ALTER TABLE Orders
  ADD CONSTRAINT Orders_FK99 FOREIGN KEY
  ( CustomerID ) REFERENCES
  Customers ( CustomerID );
