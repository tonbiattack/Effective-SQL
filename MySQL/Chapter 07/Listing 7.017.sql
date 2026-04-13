-- This view was already created by Item44Structure.sql

-- 【概要】BeerStylesビューの定義を示すサンプル。カテゴリ・国・スタイル・最大アルコール度数を結合して返すビューの作成例（コメントアウトされた参照用コード）。

-- Listing 7.18 CREATE VIEW statement 

-- CREATE VIEW BeerStyles AS
-- SELECT Cat.CategoryDS AS Category, Cou.CountryNM AS Country, Sty.StyleNM AS Style, Sty.ABVHighNb AS MaxABV
-- FROM Styles AS Sty INNER JOIN Categories AS Cat
--   ON Sty.CategoryFK = Cat.CategoryID
-- INNER JOIN Countries AS Cou
--   ON Sty.CountryFK = Cou.CountryID;
