-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】3重CROSS JOINで全商品の3アイテムセット組み合わせを生成する。商品番号の順序条件で重複を排除し、全ユニークな3商品の組み合わせを取得する。

USE SalesOrdersSample;

-- ProductsテーブルをCROSS JOINで3重に自己結合し、全ユニーク3商品セットを生成
SELECT Prod1.ProductNumber AS P1Num, Prod1.ProductName AS P1Name,
    Prod2.ProductNumber AS P2Num, Prod2.ProductName AS P2Name,
    Prod3.ProductNumber AS P3Num, Prod3.ProductName AS P3Name
FROM Products AS Prod1 CROSS JOIN Products AS Prod2
   CROSS JOIN Products AS Prod3
WHERE Prod1.ProductNumber < Prod2.ProductNumber AND
    Prod2.ProductNumber < Prod3.ProductNumber;
