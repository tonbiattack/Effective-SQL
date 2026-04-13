# Effective SQL - MySQL Docker 環境

## 概要

このDocker環境を使うと、`Effective SQL` 書籍のサンプルデータベースを  
ローカルのMySQLサーバーで動作確認できます。

- **MySQL 8.0** が自動起動します
- **Adminer**（Web UI）でブラウザからDBを操作できます
- 起動時に全サンプルデータベースが自動作成されます

---

## 前提条件

- [Docker Desktop](https://www.docker.com/products/docker-desktop) がインストール済みであること

---

## 起動方法

```bash
cd MySQL
docker-compose up -d
```

初回起動時はMySQLイメージのダウンロードとDBの初期化が行われます（数分かかる場合があります）。

### 状態確認

```bash
docker-compose ps
docker-compose logs -f mysql
```

---

## 接続情報

| 項目 | 値 |
|------|-----|
| ホスト | `localhost` |
| ポート | `3306` |
| rootパスワード | `effectivesql` |
| ユーザー名 | `sqluser` |
| パスワード | `sqlpass` |

### Adminer（Web UI）

ブラウザで http://localhost:8080 にアクセス:

| 項目 | 値 |
|------|-----|
| サーバー | `mysql` |
| ユーザー名 | `sqluser` |
| パスワード | `sqlpass` |

---

## 利用可能なサンプルDB

起動時に以下のデータベースが自動作成されます:

| データベース名 | 説明 |
|---------------|------|
| `SalesOrdersSample` | 販売注文DB（最も多く使用） |
| `EntertainmentAgencySample` | エンターテインメントエージェンシーDB |
| `BowlingLeagueSample` | ボウリングリーグDB |
| `RecipesSample` | レシピDB |
| `BeerStylesExample` | ビールスタイルDB |
| `StudentGradesExample` | 学生成績DB |
| `Item02Example` ～ `Item55Example` | 各章の練習問題用DB |

---

## SQLの実行方法

### 方法1: Adminer（ブラウザ）

http://localhost:8080 にアクセスしてSQLを入力・実行

### 方法2: mysql コマンドライン（コンテナ内）

```bash
# コンテナに接続
docker exec -it effective-sql-mysql mysql -u sqluser -psqlpass SalesOrdersSample

# SQLファイルを実行（例: Chapter 01）
docker exec -i effective-sql-mysql mysql -u sqluser -psqlpass SalesOrdersSample \
  < "Chapter 01/Listing 1.001.sql"
```

### 方法3: コンテナ内のSQLファイルを直接実行

コンテナ内では `/sql/` 以下にSQLファイルがマウントされています:

```bash
docker exec -it effective-sql-mysql bash

# コンテナ内で実行
mysql -u sqluser -psqlpass SalesOrdersSample < /sql/chapter01/Listing\ 1.001.sql
```

---

## 停止・削除

```bash
# 停止（データは保持）
docker-compose down

# 停止＋データ削除（完全リセット）
docker-compose down -v
```

---

## トラブルシューティング

### ポート3306が使用中

ローカルにMySQLが既にインストールされている場合、ポートが競合します。  
`docker-compose.yml` のポートを変更してください:

```yaml
ports:
  - "3307:3306"  # 左側(ホスト側)を変更
```

接続時は `localhost:3307` を使用します。

### 初期化が完了していない

初回起動後、DBの初期化に時間がかかる場合があります:

```bash
docker-compose logs -f mysql
# "ready for connections" が表示されるまで待機
```
