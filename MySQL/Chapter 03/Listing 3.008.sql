-- Ensure you've run Item21StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】SalesSummary テーブルから10月（October）の数量と売上データのみを取得するクエリ。
--         横持ち構造から特定月のデータを取り出す基本例。

USE Item21Example;

-- Listing 3.8 SQL to extract October data
-- 10月の販売数量と売上金額を全カテゴリ分取得
SELECT Category, OctQuantity, OctSales
  FROM SalesSummary;
