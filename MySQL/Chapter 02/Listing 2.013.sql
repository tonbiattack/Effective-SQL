-- There should be no need to run this CREATE TABLE statement.
-- It was included in SalesOrdersStructure.sql, which
-- presumably you've already run.

-- 【概要】Orders テーブルの CREATE TABLE 定義例（参考用）。
--         SalesOrdersStructure.sql 実行済みの場合はエラーになる。
--         OrderNumber は AUTO_INCREMENT の主キー相当。

-- Listing 2.13 Sample table creation SQL
-- 注文ヘッダテーブルの定義（既に存在する場合は実行不要）
CREATE TABLE Orders (
	OrderNumber int NOT NULL AUTO_INCREMENT ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL ,
	EmployeeID int NULL ,
	OrderTotal decimal (15,2) NULL 
);
