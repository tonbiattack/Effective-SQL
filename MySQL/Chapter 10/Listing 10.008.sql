-- Ensure you've run Listing 10.007.sql
-- in order to run this example.

-- 【概要】パス列挙モデルで指定ノード配下の全子孫を取得する。LIKE句でHierarchyPathのプレフィックス一致を使い、ノードパス'1/2/'以下の全従業員を取得する。

USE Item60Example;

-- ノードパス '1/2/' のサブツリーを検索するための変数
SET @Nodepath = '1/2/' COLLATE utf8_unicode_ci;

-- パスが'1/2/'で始まる（LIKE演算子）全子孫ノードを取得
SELECT e.*
FROM Employees AS e
WHERE e.HierarchyPath LIKE CONCAT(@NodePath, '%');
