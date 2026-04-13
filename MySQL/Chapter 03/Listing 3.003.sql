-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】3つのビューを作成する。
--   vActiveCustomers        : 過去6ヶ月以内に注文があるアクティブ顧客
--   vCustomerStatistics     : 顧客ごとの注文件数・合計金額・最終注文日の統計
--   vActiveCustomerStatistics: 上記2ビューを結合したアクティブ顧客の統計ビュー

USE SalesOrdersSample;

-- Listing 3.3 Three view definitions
-- アクティブ顧客ビュー（過去6ヶ月以内に注文あり）
CREATE VIEW vActiveCustomers AS
SELECT c.CustomerID, c.CustFirstName, c.CustLastName, 
  c.CustFirstName + ' ' + c.CustLastName AS CustFullName
FROM Customers AS c
WHERE EXISTS 
 (SELECT NULL
  FROM Orders AS o
  WHERE o.CustomerID = c.CustomerID
    AND o.OrderDate > DATE_ADD(CURDATE(), INTERVAL -6 MONTH));

-- 顧客統計ビュー（注文件数・合計金額・最終注文日を GROUP BY で集計）
CREATE VIEW vCustomerStatistics AS
SELECT o.CustomerID, COUNT(o.OrderNumber) AS OrderCount,
  SUM(o.OrderTotal) AS GrandOrderTotal, MAX(o.OrderDate) AS LastOrderDate
FROM Orders AS o
GROUP BY o.CustomerID;

-- アクティブ顧客統計ビュー（vActiveCustomers と vCustomerStatistics を INNER JOIN）
CREATE VIEW vActiveCustomerStatistics AS
SELECT a.CustomerID, a.CustFirstName, a.CustLastName,
  s.LastOrderDate, s.GrandOrderTotal
FROM vActiveCustomers AS a
INNER JOIN vCustomerStatistics AS s
  ON a.CustomerID = s.CustomerID;
