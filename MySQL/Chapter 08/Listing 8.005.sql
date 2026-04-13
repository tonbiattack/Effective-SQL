-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】「Accessories」カテゴリの商品別売上合計を集計する。IN句のサブクエリでカテゴリフィルタを適用し、数量×単価で売上を計算する。

USE SalesOrdersSample;

-- AccessoriesカテゴリのProductNumberをサブクエリで取得し、商品別売上合計を計算
SELECT OD.ProductNumber,
  SUM(OD.QuantityOrdered * OD.QuotedPrice) AS ProductSales
FROM Order_Details AS OD
WHERE OD.ProductNumber IN
   (SELECT P.ProductNumber
    FROM Products AS P INNER JOIN Categories AS C
        ON P.CategoryID = C.CategoryID
    WHERE C.CategoryDescription = 'Accessories')
GROUP BY OD.ProductNumber;
