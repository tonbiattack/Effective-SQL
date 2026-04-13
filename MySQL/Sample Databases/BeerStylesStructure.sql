-- 【概要】BeerStylesExampleデータベースを作成し、ビールスタイル管理システムのテーブルを定義する。カテゴリ・国・スタイルの3テーブルで構成し、スタイルにはアルコール度数・色・苦味の範囲情報を格納する。

CREATE DATABASE BeerStylesExample;

USE BeerStylesExample;

-- ビールカテゴリテーブル（カテゴリID・カテゴリ説明）
CREATE TABLE Categories (
  CategoryID int NOT NULL,
  CategoryDS varchar(50) NULL
);

-- 国テーブル（国ID・国名）
CREATE TABLE Countries (
  CountryID int NOT NULL,
  CountryNM varchar(50) NULL
);

-- スタイルテーブル（スタイルID・カテゴリFK・国FK・スタイル名・色範囲・ABV範囲・IBU範囲）
CREATE TABLE Styles (
  StyleID int NOT NULL,
  CategoryFK int NULL,
  CountryFK int NULL,
  StyleNM varchar(50) NULL,
  ColourLowNb float NULL,
  ColourHighNb float NULL,
  ABVLowNb float NULL,
  ABVHighNb float NULL,
  IBULowNb float NULL,
  IBUHighNb float NULL
);


ALTER TABLE Categories 
  ADD CONSTRAINT Categories_PK PRIMARY KEY ( CategoryID );

ALTER TABLE Countries
  ADD CONSTRAINT Countries_PK PRIMARY KEY ( CountryID );

ALTER TABLE Styles
  ADD CONSTRAINT Styles_FK00 FOREIGN KEY ( CategoryFK ) REFERENCES Categories (CategoryID),
  ADD CONSTRAINT Styles_FK01 FOREIGN KEY ( CountryFK ) REFERENCES Countries (CountryID),
  ADD CONSTRAINT Styles_PK PRIMARY KEY ( StyleID );
 
