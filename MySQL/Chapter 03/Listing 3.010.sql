-- Ensure you've run Item21StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】Listing 3.009 を改良し、月名ラベル（'Oct' 等）を SalesMonth 列として追加した
--         UNION 縦持ち変換クエリ。Quantity・SalesAmt の列名も統一して整形した版。

USE Item21Example;

-- Listing 3.10 Tidying up the UNION query used to normalize the data
-- 月名リテラルを SalesMonth 列として付与し、カラム名を統一した整形版
SELECT Category, 'Oct' AS SalesMonth, OctQuantity AS Quantity, OctSales AS SalesAmt
FROM SalesSummary
UNION
SELECT Category, 'Nov', NovQuantity, NovSales
FROM SalesSummary
UNION
SELECT Category, 'Dec', DecQuantity, DecSales
FROM SalesSummary
UNION
SELECT Category, 'Jan', JanQuantity, JanSales
FROM SalesSummary
UNION
SELECT Category, 'Feb', FebQuantity, FebSales
FROM SalesSummary;

