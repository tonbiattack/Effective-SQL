-- Database and sample data for Item04.

-- 【概要】著者情報を非正規化形式（氏名と住所を1列に結合）で格納するAuthorsUnnormalizedテーブルのデモ用DB。第1正規形違反（1列に複数の情報を格納）の例を示す。

CREATE DATABASE Item04Example;

USE Item04Example;

-- 非正規化著者テーブル: 氏名と完全住所を1列に結合して格納する設計問題の例
CREATE TABLE AuthorsUnnormalized
  (AuthID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  AuthName varchar (255),
  AuthAddress  varchar (255));
 
INSERT INTO AuthorsUnnormalized (AuthName, AuthAddress)
VALUES ('John L. Viescas', '1175 7th Street, Austin, TX 78701, USA');

INSERT INTO AuthorsUnnormalized (AuthName, AuthAddress)
VALUES ('Douglas J. Steele', '555 Sherbourne St, Toronto, ON, M4X 1W6, Canada');

INSERT INTO AuthorsUnnormalized (AuthName, AuthAddress)
VALUES ('Ben Clothier', '2015 Monterey St, San Antonio, TX 78207, USA');

INSERT INTO AuthorsUnnormalized (AuthName, AuthAddress)
VALUES ('Tom Wickerath', '2317 185th Place NE, Redmond, WA 98052, USA');
