-- Ensure you've run Item21StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】Listing 3.010 に ORDER BY を追加し、月名・カテゴリ順でソートした完成版クエリ。
--         UNION 全体に対して1つの ORDER BY を末尾に指定する構文を示す。

USE Item21Example;

-- Listing 3.11 Specifying the sort order of the UNION query
-- UNION の最終 SELECT の後に ORDER BY を記述して全結果をソート
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
FROM SalesSummary
ORDER BY SalesMonth, Category;  -- 月名・カテゴリの昇順でソート






