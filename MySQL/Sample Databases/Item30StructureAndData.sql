-- Create a new database, to make it easier to cleanup afterwards.

-- 【概要】在庫データ（色・サイズ・数量）のデモ用DB。UNPIVOT操作や多次元集計のサンプルとして使用するシンプルなInventoryテーブル。

CREATE DATABASE Item30Example;

USE Item30Example;

-- 在庫テーブル（色・サイズ・数量）
CREATE TABLE Inventory (
  Color varchar(15) NULL,
  Dimension  varchar(5) NULL,
  Quantity int NULL
);

INSERT INTO Inventory (Color, Dimension, Quantity) VALUES ('Red', 'L', 10);
INSERT INTO Inventory (Color, Dimension, Quantity) VALUES ('Blue', 'M', 20);
INSERT INTO Inventory (Color, Dimension, Quantity) VALUES ('Red', 'M', 15);
INSERT INTO Inventory (Color, Dimension, Quantity) VALUES ('Blue', 'L', 5);

