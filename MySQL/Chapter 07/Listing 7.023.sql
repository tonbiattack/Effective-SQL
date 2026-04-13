-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】社員IDによる注文検索クエリ（インデックスなし版）。2人の従業員について担当注文番号と顧客IDを取得し、インデックス効果の比較に使用する。

USE SalesOrdersSample;

-- 従業員ID=751の担当注文を取得
SELECT o.OrderNumber, o.CustomerID
FROM Orders AS o
WHERE EmployeeID = 751;

-- 従業員ID=708の担当注文を取得
SELECT o.OrderNumber, o.CustomerID
FROM Orders AS o
WHERE EmployeeID = 708;
