-- Ensure you've run BeerStylesStructure.sql and BeerStylesData.sql in order to run this example.

-- 【概要】サブクエリ（IN）を使ってベルギー原産のビールスタイルを取得する。
--         CountriesテーブルからベルギーのIDを取得し、StylesテーブルのINフィルタで利用する。
--         6.017（JOIN版）、6.018（EXISTS版）と比較すること。

USE BeerStylesExample;

-- Listing 6.16 Selecting styles from Belgium using a subquery

-- サブクエリでベルギーのCountryIDを取得してStylesをINで絞り込む
SELECT StyleNm
FROM Styles
WHERE CountryFK IN
  (SELECT CountryID
  FROM Countries
  WHERE CountryNM = 'Belgium');
