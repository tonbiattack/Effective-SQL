-- Ensure you've run Item36StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】複数の集計を1つのSELECTで取得する効率的なパターン。
--         COUNT(列名)でNULL除外カウント、COUNT(DISTINCT)でユニーク数、
--         COUNT(CASE WHEN ...)で条件付きカウントを実現する。
--         複数のSELECTを発行するより効率的でパフォーマンスが良い。

USE Item36Example;

-- Listing 5.28 Multiple counts in a single query
SELECT COUNT(*) AS TotalRows,                                   -- 全行数（NULL含む）
  COUNT(CustomerID) AS TotalOrdersWithCustomers,               -- CustomerIDがNULLでない件数
  COUNT(EmployeeID) AS TotalOrdersWithEmployees,               -- EmployeeIDがNULLでない件数
  COUNT(DISTINCT CustomerID) AS TotalUniqueCustomers,          -- ユニーク顧客数
  -- CASE WHENでフィルタし$1000超の注文数をカウント
  COUNT(CASE WHEN OrderTotal > 1000 THEN CustomerID END) AS TotalLargeOrders,
  -- DISTINCT付きCASEで$1000超注文をしたユニーク顧客数をカウント
  COUNT(DISTINCT CASE WHEN OrderTotal > 1000 THEN CustomerID END) AS TotalUniqueCust_LargeOrders
FROM OrdersTable;

