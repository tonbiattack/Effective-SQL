-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】デカルト積とLEFT JOINを組み合わせて、全顧客×全商品の一覧を生成し、購入済み商品にフラグを立てる。CASE式で「購入済み」を判定する実践的なクロス集計例。

USE SalesOrdersSample;

-- Listing 8.3 Listing all customers and all products, flagging products already purchased by each customer
-- サブクエリCustProdで全顧客×全商品のデカルト積を生成
-- サブクエリOrdDetで顧客ごとの商品購入回数を集計
-- LEFT JOINで結合し、購入済みかどうかをCASE式で判定
SELECT CustProd.CustomerID, CustProd.CustFirstName, CustProd.CustLastName,
  CustProd.ProductNumber, CustProd.ProductName,
  (CASE WHEN OrdDet.OrderCount > 0
    THEN 'You purchased this!'
    ELSE ' '
  END) AS ProductOrdered
FROM
(SELECT C.CustomerID, C.CustFirstName, C.CustLastName,
  P.ProductNumber, P.ProductName, P.ProductDescription
FROM Customers AS C, Products AS P) AS CustProd
LEFT JOIN
(SELECT O.CustomerID, OD.ProductNumber, Count(*) AS OrderCount
FROM Orders AS O INNER JOIN Order_Details AS OD
  ON O.OrderNumber = OD.OrderNumber
GROUP BY O.CustomerID, OD.ProductNumber) AS OrdDet
  ON CustProd.CustomerID = OrdDet.CustomerID
  AND CustProd.ProductNumber = OrdDet.ProductNumber
ORDER BY CustProd.CustomerID, CustProd.ProductName;
