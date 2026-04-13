-- This table already exists in the Sales Orders sample database.
-- You can create the Sales Orders sample database by executing
--   SalesOrdersStructure.sql and SalesOrdersData.sql in the Sample Databases folder.
-- If you attempt to run this listing, you will get an error.

-- 【概要】Order_Details テーブルの CREATE TABLE 定義例。
--         ExtendedPrice を GENERATED ALWAYS AS（計算列）で定義している。
--         既存テーブルと重複するため実行するとエラーになる（参考用）。

USE SalesOrdersSample;

-- ExtendedPrice は QuotedPrice * QuantityOrdered の計算列として自動生成される
CREATE TABLE Order_Details (
  OrderNumber int NOT NULL ,
  ProductNumber int NOT NULL ,
  QuotedPrice decimal(15,2) DEFAULT 0 NULL ,
  QuantityOrdered smallint DEFAULT 0 NULL ,
  ExtendedPrice decimal(15,2)  
    GENERATED ALWAYS AS (QuotedPrice * QuantityOrdered)
);