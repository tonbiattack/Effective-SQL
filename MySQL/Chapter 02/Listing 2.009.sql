-- Ensure you've run Listing 2.008.sql to create the Customers table

-- 【概要】Customers テーブルに (CustLastName, CustFirstName) の複合インデックス CustName を
--         作成する。姓を先頭にすることで姓による絞り込みに適した適切な設計例。

USE Item11Example;

-- Listing 2.9 Appropriate Index Creation SQL
-- 姓優先の複合インデックス（姓単独検索にも有効）
CREATE INDEX CustName ON Customers(CustLastName, CustFirstName);
