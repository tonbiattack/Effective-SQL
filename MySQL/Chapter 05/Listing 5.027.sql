
-- Ensure you've run Item36StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】注文テーブルから$1000超の注文数を取得する基本クエリ。
--         単純なCOUNT(*)とWHEREフィルタによる基本集計。
--         5.028では複数の集計を1クエリで取得するより効率的な方法を示す。

USE Item36Example;


-- Listing 5.27 Possible query for determining how many orders exceeded $1000.00
-- $1000超の注文件数のみを取得する単純なクエリ
SELECT COUNT(*) AS TotalOrders
FROM OrdersTable
WHERE OrderTotal > 1000;

