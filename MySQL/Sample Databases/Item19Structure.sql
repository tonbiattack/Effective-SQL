-- 【概要】PostシリアルブランドのPost社製品別月次売上をピボット形式で格納するデモ用DB。商品名と12ヶ月分の売上を1行に格納したクロス集計テーブルの例（非正規化）。

CREATE DATABASE Item19Example;

USE Item19Example;

-- 商品別月次売上テーブル: 商品名と1月〜12月の売上を1行に格納した横型（ピボット）テーブル
CREATE TABLE tblPostSales(
    Product varchar (255),
    Jan decimal(15, 2), 
    Feb decimal(15, 2), 
    Mar decimal(15, 2), 
    Apr decimal(15, 2), 
    May decimal(15, 2), 
    Jun decimal(15, 2), 
    Jul decimal(15, 2), 
    Aug decimal(15, 2), 
    Sep decimal(15, 2), 
    Oct decimal(15, 2), 
    Nov decimal(15, 2), 
    Decm decimal(15, 2));  
