-- Ensure you've run BeerStylesStructure.sql and BeerStylesData.sql in order to run this example.

-- 【概要】LEFT JOINを使ってベルギー原産または国籍不明のビールスタイルを取得する。
--         LEFT JOINでCountriesに一致しない行（国籍NULLのスタイル）もOR条件で保持する。
--         6.016〜6.018と異なりNULLの国籍スタイルも含める拡張パターン。

USE BeerStylesExample;

-- Listing 6.19 Selecting styles from Belgium or unknown using a LEFT JOIN

-- LEFT JOINでCountriesに一致しないスタイル（国籍NULL）もBelgiumと共に取得
SELECT S.StyleNm
FROM Styles AS S LEFT JOIN Countries AS C
  ON S.CountryFK = C.CountryID
WHERE C.CountryNM = 'Belgium'
  OR C.CountryNM IS NULL;
