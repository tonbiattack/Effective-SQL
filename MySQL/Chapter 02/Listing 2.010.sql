-- Ensure you've run Listing 2.008.sql to create the Customers table

-- 【概要】(CustFirstName, CustLastName) の順序でインデックスを作成する不適切な例。
--         名が先頭のため姓のみの検索ではインデックスが活用されにくい。
--         Listing 2.009 との比較用。

USE Item11Example;

-- If you've run Listing 2.009.sql, you'll need to drop the index created
-- in that listing, since we re-used the index name.
-- If you have not run Listing 2.009.sql, comment out the DROP INDEX statement.
-- 既存の CustName インデックスを削除してから再作成
DROP INDEX CustName ON Customers;

-- Listing 2.10 Less appropriate Index Creation SQL
-- 名優先の複合インデックス（姓のみ検索には非効率）
CREATE INDEX CustName ON Customers(CustFirstName, CustLastName);

-- Run the following if you do not want to keep the index.
-- DROP INDEX CustName ON Customers;

