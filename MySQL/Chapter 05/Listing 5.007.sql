-- Ensure you've run Item30StructureAndData.sql in the Sample Databases folder
-- in order to create the Inventory table

-- 【概要】MySQLがGROUPING SETSをサポートしないため、GROUP BY + UNIONで代替する。
--         Color別集計・Dimension別集計・全体合計をUNIONで縦結合し
--         GROUPING SETSと同等の結果を得る。

USE Item30Example;

-- Listing 5.7 Using simple GROUP BY instead of GROUPING SETS
-- Color別集計（Dimensionは NULL で全体を表す）
SELECT Color, NULL AS Dimension, SUM(Quantity) AS TotalQuantity
FROM Inventory
GROUP BY Color
UNION
-- Dimension別集計（Colorは NULL）
SELECT NULL, Dimension, SUM(Quantity)
FROM Inventory
GROUP BY Dimension
UNION
-- 全体合計（Color/Dimensionともに NULL）
SELECT NULL, NULL, SUM(Quantity)
FROM Inventory;