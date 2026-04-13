-- Ensure you've run Item33StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】最高アルコール度数のビールの原産国を取得しようとした不正なクエリ。
--         CategoryとCountryの両方でGROUP BYすると、カテゴリ内の全Country組み合わせが
--         返るため、「最高度数の1レコード」ではなく全組み合わせが集計されてしまう悪い例。

USE Item33Example;

-- Listing 5.18 Incorrect SQL Statement to determine originating country for beer with highest alcohol level
-- 問題: Category+Countryでグループ化すると意図した結果が得られない
SELECT Category, Country, MAX(MaxABV) AS MaxAlcohol
FROM BeerStyles
GROUP BY Category, Country;

