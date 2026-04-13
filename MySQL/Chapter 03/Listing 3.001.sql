-- Ensure you've run Item18StructureAndData.sql in the Sample Databases folder in order to run this example.

-- 【概要】非正規化テーブル CustomerSales から DISTINCT と VIEW を使って
--         vCustomers / vAutomobileModels / vEmployees の3ビューを作成し正規化する例。

USE Item18Example;

-- Listing 3.1 Views to normalize a denormalized table
-- 顧客情報ビュー（重複を DISTINCT で排除）
CREATE VIEW vCustomers AS
SELECT DISTINCT cs.CustFirstName, cs.CustLastName, cs.Address, cs.City, cs.Phone
FROM CustomerSales AS cs;

-- 車種情報ビュー（年式・モデル名の重複を排除）
CREATE VIEW vAutomobileModels AS
SELECT DISTINCT cs.ModelYear, cs.Model
FROM CustomerSales AS cs;

-- 担当営業員ビュー（重複を排除）
CREATE VIEW vEmployees AS
SELECT DISTINCT cs.SalesPerson
FROM CustomerSales AS cs;
