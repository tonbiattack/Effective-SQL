-- Ensure you've run BeerStylesStructure.sql and BeerStylesData.sql in order to run this example.

-- 【概要】EXISTS相関サブクエリを使ってベルギー原産のビールスタイルを取得する。
--         6.016（IN版）、6.017（JOIN版）と同等の結果をEXISTSで実現する。
--         SELECT NULLはEXISTSの存在確認のみで値は不要のため、推奨の書き方。

USE BeerStylesExample;

-- Listing 6.18 Selecting styles from Belgium using an EXISTS clause

-- EXISTS相関サブクエリでCountriesテーブルのベルギーIDとの一致を確認
SELECT S.StyleNm
FROM Styles AS S
WHERE EXISTS (SELECT NULL FROM Countries WHERE CountryNM = 'Belgium'
  AND Countries.CountryID = S.CountryFK);
