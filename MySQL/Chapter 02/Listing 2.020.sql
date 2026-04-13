-- Note that this listing is NOT what's in the book.
-- That's because MySQL does not support the same DRI as Access does.
-- The CREATE TABLE statement for Access was

-- 【概要】Item13Example データベースに OrgChart テーブル（自己参照外部キー）を作成する。
--         manager_employeeID が同テーブルの employeeID を参照し、
--         ON DELETE SET NULL / ON UPDATE CASCADE を設定した組織階層の実装例。
--
-- CREATE TABLE OrgChart (
--   employeeID INTEGER NOT NULL PRIMARY KEY,
--   manager_employeeID INTEGER
-- CONSTRAINT SelfReference FOREIGN KEY (manager_employeeID)
-- REFERENCES OrgChart (employeeID)
-- ON DELETE SET NULL
-- ON UPDATE CASCADE);

-- Create a new database, to make it easier to cleanup afterwards.

CREATE DATABASE Item13Example;

USE Item13Example;

-- Listing 2.20 Table Creation SQL
-- 組織階層テーブル（employeeID が UNIQUE、manager_employeeID は自己参照外部キー）
CREATE TABLE OrgChart (
  employeeID int NOT NULL UNIQUE,
  manager_employeeID int
);

-- 自己参照外部キーを追加（削除時は NULL にセット、更新時は CASCADE）
ALTER TABLE OrgChart
ADD CONSTRAINT fkOrgChart FOREIGN KEY (manager_employeeID)
 REFERENCES OrgChart (employeeID)
 ON DELETE SET NULL
 ON UPDATE CASCADE
; 
 
