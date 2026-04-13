-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- Works only on MySQL 5.7.8 and newer

-- 【概要】Order_Details テーブルに計算列 ExtendedPrice（QuantityOrdered * QuotedPrice）を
--         GENERATED ALWAYS AS で追加し、インデックスを作成した後、列ごと削除するスクリプト

USE SalesOrdersSample;

-- Create the calculated column using an expression
ALTER TABLE Order_Details
  ADD COLUMN ExtendedPrice decimal (15, 2)
  GENERATED ALWAYS AS (QuantityOrdered * QuotedPrice);

-- Index the calculated column
CREATE INDEX Order_Details_ExtendedPrice
ON Order_Details (ExtendedPrice);

-- Now clean it up
ALTER TABLE Order_Details DROP COLUMN ExtendedPrice;
