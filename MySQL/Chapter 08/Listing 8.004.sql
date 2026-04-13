-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】IN句を使用したサブクエリで購入済み商品にフラグを立てる代替アプローチ。Listing 8.3と同等の結果をサブクエリとIN句で実現する比較例。

USE SalesOrdersSample;

-- Listing 8.4 Alternative approach for listing all customers and all products, flagging products already purchased by each customer

-- IN句のサブクエリでその商品を購入した顧客IDを取得し、CASE式で購入済みフラグを設定
SELECT C.CustomerID, C.CustFirstName, C.CustLastName,
  P.ProductNumber, P.ProductName,
  (CASE WHEN C.CustomerID IN
    (SELECT Orders.CustomerID
     FROM Orders INNER JOIN Order_Details
       ON Orders.OrderNumber = Order_Details.OrderNumber
     WHERE Order_Details.ProductNumber = P.ProductNumber)
     THEN 'You purchased this!'
     ELSE ' '
  END) AS ProductOrdered
FROM Customers AS C, Products AS P
ORDER BY C.CustomerID, P.ProductName;
