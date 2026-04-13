-- Ensure you've run Item21StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】SalesSummary の横持ちデータ（Oct〜Feb の5ヶ月分）を
--         UNION で縦持ちに正規化するクエリ。月ラベルなしの基本形。

USE Item21Example;

-- Listing 3.9 Using UNION to normalize the data
-- 各月（Oct・Nov・Dec・Jan・Feb）の数量と売上を UNION で縦方向に展開
SELECT Category, OctQuantity, OctSales
  FROM SalesSummary
UNION
SELECT Category, NovQuantity, NovSales
  FROM SalesSummary
UNION
SELECT Category, DecQuantity, DecSales
  FROM SalesSummary
UNION
SELECT Category, JanQuantity, JanSales
  FROM SalesSummary
UNION
SELECT Category, FebQuantity, FebSales
  FROM SalesSummary;

