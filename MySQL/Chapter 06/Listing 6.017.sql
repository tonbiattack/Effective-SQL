-- Ensure you've run BeerStylesStructure.sql and BeerStylesData.sql in order to run this example.

-- 【概要】INNER JOINを使ってベルギー原産のビールスタイルを取得する。
--         6.016（サブクエリ版）と同等の結果をJOINで実現する。
--         一般的にJOINの方がオプティマイザに最適化されやすい。

USE BeerStylesExample;

-- Listing 6.17 Selecting styles from Belgium using a JOIN

-- StylesとCountriesをINNER JOINしてベルギーのスタイルを取得
SELECT S.StyleNm
FROM Styles AS S INNER JOIN Countries AS C
  ON S.CountryFK = C.CountryID
WHERE C.CountryNM = 'Belgium';
