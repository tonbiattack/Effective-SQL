-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】LEFT JOINを使った「フラストレーテッドジョイン」で未注文商品を取得する。
--         Order_Detailsに一致行がない場合にNULLが返ることを利用して差集合を実現する。
--         NOT IN / NOT EXISTSの代替パターン。

USE SalesOrdersSample;

-- Listing 4.6 Using a 'Frustrated Join'

-- LEFT JOINしてOrder_Details側がNULLになる行（未注文商品）のみを取得
SELECT P.ProductNumber, P.ProductName
FROM Products AS P LEFT JOIN Order_Details AS OD
  ON P.ProductNumber = OD.ProductNumber
WHERE OD.ProductNumber IS NULL;

