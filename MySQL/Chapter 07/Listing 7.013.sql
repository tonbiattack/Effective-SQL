-- Ensure Item44Structure.sql has been run first to be consistent with answers in the book.

-- 【概要】INFORMATION_SCHEMAを使用してデータベース内のテーブルとビューの一覧を取得する。

USE Item44Example;

-- Listing 7.14 Get a list of tables and views

-- Item44ExampleデータベースのBASE TABLE（テーブル）とVIEW（ビュー）を取得
SELECT T.TABLE_NAME, T.TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES AS T
WHERE T.TABLE_SCHEMA = 'Item44Example'
  AND T.TABLE_TYPE IN ('BASE TABLE', 'VIEW');
