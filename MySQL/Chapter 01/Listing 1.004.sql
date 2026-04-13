-- Be sure run Item04StructureAndData.sql in the Sample Databases folder
-- and Listing 1.003 before attempting to run this listing.

-- 【概要】Authors テーブルから CASE 式で AuthMid の NULL を判定し、
--         フルネーム（AuthName）と住所（AuthAddress）を整形して取得するクエリ

USE Item04Example;

-- CASE 式で中間名 NULL を考慮しながらフルネームを構築
-- CONCAT で住所各フィールドを連結して AuthAddress を生成
SELECT AuthorID AS AuthID, CONCAT(AuthFirst, 
  CASE 
    WHEN AuthMid IS NULL
    THEN ' '
    ELSE CONCAT(' ', AuthMid, ' ')
  END, AuthLast) AS AuthName,
  CONCAT(AuthStNum, ' ', AuthStreet, ' ', 
      AuthCity, ', ', AuthStProv, ' ', 
      AuthPostal, ', ', AuthCountry) 
    AS AuthAddress
FROM Authors;

-- Remove comments and run the following if you want
-- to run Listing 1.003 again.

-- DROP TABLE Authors;


