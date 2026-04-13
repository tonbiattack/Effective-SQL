-- Docker起動時の初期化スクリプト
-- sqluser に全データベースへのアクセス権を付与する

GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
