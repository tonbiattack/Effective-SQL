-- Create a new database, to make it easier to cleanup afterwards.

-- 【概要】Item11Example データベースを新規作成し、Customers テーブルと
--         CustState 単一インデックスを作成するスクリプト

CREATE DATABASE Item11Example;

USE Item11Example;

-- Listing 2.8 Table Creation SQL
-- 顧客情報テーブルを作成（CustomerID が主キー）
CREATE TABLE Customers (
	CustomerID int PRIMARY KEY NOT NULL ,
	CustFirstName varchar (25) NULL ,
	CustLastName varchar (25) NULL ,
	CustStreetAddress varchar (50) NULL ,
	CustCity varchar (30) NULL ,
	CustState varchar (2) NULL ,
	CustZipCode varchar (10) NULL ,
	CustAreaCode smallint NULL ,
	CustPhoneNumber varchar (8) NULL 
);

-- 州コードによる検索を高速化する単一列インデックスを作成
CREATE INDEX CustState ON Customers(CustState);
