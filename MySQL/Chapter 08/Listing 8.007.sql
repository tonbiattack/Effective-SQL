-- Ensure you've run BowlingLeagueStructure.sql
-- and BowlingLeagueData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】ボウリングリーグのTeamsテーブル定義例。チームID・チーム名・キャプテンIDを持つ基本テーブル構造を示す（既にBowlingLeagueSampleに存在するため参照用）。

USE BowlingLeagueSample;

-- Note that this table already exists in the BowlingLeagueSample database
-- Change the table name if you want to test this listing.

-- チームID（主キー）・チーム名・キャプテンIDを持つTeamsテーブルを定義
CREATE TABLE Teams (
  TeamID int NOT NULL PRIMARY KEY ,
  TeamName varchar (50) NOT NULL ,
  CaptainID int NULL );
