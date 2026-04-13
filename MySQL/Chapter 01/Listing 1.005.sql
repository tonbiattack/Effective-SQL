-- This table already exists in the Sales Orders sample database.
-- You can create the Sales Orders sample database by executing
--   SalesOrdersStructure.sql and SalesOrdersData.sql in the Sample Databases folder.
-- If you attempt to run this listing, you will get an error.

-- 【概要】SalesOrdersSample に Orders テーブルを CREATE しようとする例。
--         既にテーブルが存在するため実行するとエラーになる（意図的な失敗例）。

USE SalesOrdersSample;

-- この CREATE TABLE は既存テーブルと重複するためエラーになる
CREATE TABLE Orders (
  OrderNumber int NOT NULL ,
  OrderDate date NULL ,
  ShipDate date NULL ,
  CustomerID int NULL ,
  EmployeeID int NULL ,
  OrderTotal decimal (15,2) NULL );
