-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Orders レコード削除後に Order_Details の関連レコードを削除する
--         AFTER DELETE トリガー DelCascadeTrig を作成する。
--         外部キー CASCADE の代替としてトリガーで参照整合性を維持する例。

USE SalesOrdersSample;

-- Creating a Trigger to prevent orphan records in the child table
-- Orders 削除後に対応する Order_Details を削除するトリガー
CREATE TRIGGER DelCascadeTrig AFTER DELETE
ON Orders
FOR EACH ROW
-- OLD.OrderNumber で削除された注文番号を参照
DELETE FROM Order_Details
WHERE Order_Details.OrderNumber = OLD.OrderNumber;

-- Run the following if you do not wish to keep the trigger in the database.
-- DROP TRIGGER DelCascadeTrig;
