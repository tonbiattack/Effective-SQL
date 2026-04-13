#!/bin/bash
# Effective SQL サンプルデータベース初期化スクリプト
# Docker起動時に自動実行され、主要なサンプルデータベースを作成します

set -e

MYSQL_CMD="mysql -u root -p${MYSQL_ROOT_PASSWORD} --default-character-set=utf8mb4"
SQL_DIR="/sql/sample-databases"

echo "=== Effective SQL サンプルDB初期化開始 ==="

# sqluser に全権限を付与
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# SQLファイルを実行する関数
run_sql() {
    local file="$1"
    echo "実行中: $file"
    $MYSQL_CMD < "$file"
}

# ============================================================
# SalesOrders サンプルDB（最もよく使われるサンプル）
# ============================================================
run_sql "${SQL_DIR}/SalesOrdersStructure.SQL"
run_sql "${SQL_DIR}/SalesOrdersData.SQL"

# ============================================================
# EntertainmentAgency サンプルDB
# ============================================================
run_sql "${SQL_DIR}/EntertainmentAgencyStructure.SQL"
run_sql "${SQL_DIR}/EntertainmentAgencyData.SQL"

# ============================================================
# BowlingLeague サンプルDB
# ============================================================
run_sql "${SQL_DIR}/BowlingLeagueStructure.SQL"
run_sql "${SQL_DIR}/BowlingLeagueData.SQL"

# ============================================================
# Recipes サンプルDB
# ============================================================
run_sql "${SQL_DIR}/RecipesStructure.SQL"
run_sql "${SQL_DIR}/RecipesData.SQL"

# ============================================================
# BeerStyles サンプルDB
# ============================================================
run_sql "${SQL_DIR}/BeerStylesStructure.sql"
run_sql "${SQL_DIR}/BeerStylesData.sql"

# ============================================================
# StudentGrades サンプルDB
# ============================================================
run_sql "${SQL_DIR}/StudentGradesStructure.sql"
run_sql "${SQL_DIR}/StudentGradesData.sql"

# ============================================================
# Item別サンプルDB（各章の練習問題用）
# ============================================================
run_sql "${SQL_DIR}/Item02StructureAndData.sql"
run_sql "${SQL_DIR}/Item03StructureAndData.sql"
run_sql "${SQL_DIR}/Item04StructureAndData.sql"
run_sql "${SQL_DIR}/Item18StructureAndData.sql"
run_sql "${SQL_DIR}/Item19Structure.sql"
run_sql "${SQL_DIR}/Item19Data.sql"
run_sql "${SQL_DIR}/Item21StructureAndData.sql"
run_sql "${SQL_DIR}/Item30StructureAndData.sql"
run_sql "${SQL_DIR}/Item33StructureAndData.sql"
run_sql "${SQL_DIR}/Item36StructureAndData.sql"
run_sql "${SQL_DIR}/Item39StructureAndData.sql"
run_sql "${SQL_DIR}/Item44Structure.sql"
run_sql "${SQL_DIR}/Item52StructureAndData.sql"
run_sql "${SQL_DIR}/Item55StructureAndData.sql"

echo "=== Effective SQL サンプルDB初期化完了 ==="
