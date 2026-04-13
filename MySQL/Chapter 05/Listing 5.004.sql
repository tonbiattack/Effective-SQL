-- Ensure you've run Item30StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】WITH ROLLUPを使って、Color/Dimension別の小計と全体合計を一度のクエリで取得する。
--         ROLLUPはGROUPING SETS相当の階層的な集計を自動生成するMySQL拡張機能。
--         小計行ではNULLが集計軸の「全体」を示す。

USE Item30Example;

-- Listing 5.4 ROLLUP sample query
-- WITH ROLLUPでColor小計・全体合計行を自動生成
SELECT Color, Dimension, SUM(Quantity) AS TotalQuantity
FROM Inventory
GROUP BY Color, Dimension WITH ROLLUP;
