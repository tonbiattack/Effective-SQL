-- Ensure Item44Structure.sql has been run first to be consistent with answers in the book.

-- 【概要】INFORMATION_SCHEMAを使用してデータベース内の制約（主キー・外部キー・ユニーク等）の一覧を取得する。

-- Listing 7.15 Get a list of constraints

-- Item44Exampleデータベースに定義されている全制約（制約名・テーブル名・制約種別）を取得
SELECT TC.CONSTRAINT_NAME, TC.TABLE_NAME, TC.CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
WHERE TC.TABLE_SCHEMA = 'Item44Example';

