-- 【概要】EAV（Entity-Attribute-Value）パターンの実装例。
--         Products テーブルと ProductAttributes テーブルを作成し、
--         ProductNumber を外部キーで紐付ける。

CREATE DATABASE Item07Example;

USE Item07Example;

-- 商品マスタテーブル（ProductNumber が主キー）
CREATE TABLE Products (
  ProductNumber int NOT NULL PRIMARY KEY,
  ProdDescription varchar(255) NOT NULL
);

-- 商品属性テーブル（ProductNumber + AttributeName の複合主キー）
CREATE TABLE ProductAttributes (
  ProductNumber int NOT NULL,
  AttributeName varchar(255) NOT NULL,
  AttributeValue varchar(255) NOT NULL,
  CONSTRAINT PK_ProductAttributes PRIMARY KEY (ProductNumber, AttributeName)
);

-- Products への外部キー制約を追加（参照整合性を保証）
ALTER TABLE ProductAttributes
ADD CONSTRAINT FK_ProductAttributes_ProductNumber
FOREIGN KEY (ProductNumber)
REFERENCES Products (ProductNumber);