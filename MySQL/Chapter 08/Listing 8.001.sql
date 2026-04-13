-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】デカルト積（CROSS JOIN）を使用して全顧客×全商品の組み合わせ一覧を生成する。JOIN条件なしの結合で全組み合わせを網羅する基礎的な例。

USE SalesOrdersSample;


-- Listing 8.1 Using a Cartesian Product to obtain a list of every customer and every product

-- CustomersとProductsの全組み合わせ（デカルト積）を生成
SELECT C.CustomerID, C.CustFirstName, C.CustLastName,
  P.ProductNumber, P.ProductName, P.ProductDescription
FROM Customers AS C, Products AS P;


