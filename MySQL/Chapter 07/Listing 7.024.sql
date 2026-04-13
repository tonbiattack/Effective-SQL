-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】カバリングインデックスを作成して注文検索クエリを最適化するデモ。EmployeeID, OrderNumber, CustomerIDの複合インデックスにより、テーブルアクセスなしで結果を返す（インデックスオンリースキャン）。

USE SalesOrdersSample;

-- EmployeeID, OrderNumber, CustomerIDのカバリングインデックスを作成
CREATE INDEX IX_Orders_EmployeeID_Included
ON Orders (EmployeeID, OrderNumber, CustomerID);

-- インデックスを利用して従業員ID=751の注文を取得
SELECT o.OrderNumber, o.CustomerID
FROM Orders AS o
WHERE EmployeeID = 751;

-- インデックスを利用して従業員ID=708の注文を取得
SELECT o.OrderNumber, o.CustomerID
FROM Orders AS o
WHERE EmployeeID = 708;

-- テスト後にインデックスを削除
DROP INDEX IX_Orders_EmployeeID_Included
ON Orders;