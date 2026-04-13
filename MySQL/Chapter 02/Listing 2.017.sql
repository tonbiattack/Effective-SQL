-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Order_Details テーブルに外部キー制約 fkOrder（ON DELETE CASCADE）を追加する。
--         Orders の親レコードが削除された際、関連する Order_Details の子レコードも
--         自動的に削除される宣言的参照整合性（DRI）の実装例。

USE SalesOrdersSample;

-- Listing 2.17 Using DRI to prevent orphan records in the child table
-- ON DELETE CASCADE により親（Orders）削除時に子（Order_Details）も連鎖削除される
ALTER TABLE Order_Details
  ADD CONSTRAINT fkOrder FOREIGN KEY (OrderNumber) REFERENCES Orders (OrderNumber) ON DELETE CASCADE;

-- Run the following if you do not wish to keep the constraint in the database.
-- ALTER TABLE Order_Details DROP FOREIGN KEY fkOrder;

