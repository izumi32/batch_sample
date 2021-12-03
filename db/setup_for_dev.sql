-- batch_userを作成、接続時のパスワードを設定
CREATE USER IF NOT EXISTS batch_user IDENTIFIED BY 'batch';
-- batch_devのデータベースを作成
CREATE DATABASE IF NOT EXISTS batch_dev DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
-- batch_devの権限をbatch_userへ付与
GRANT ALL PRIVILEGES on batch_dev.* to batch_user;
-- batch_testのデータベース作成
CREATE DATABASE IF NOT EXISTS batch_test DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
-- batch_testの権限をbatch_userへ付与
GRANT ALL PRIVILEGES on batch_test.* to batch_user;

-- ファイル読み込み
-- $ mysql -h 127.0.0.1 -u root -p < ./db/setup_for_dev.sql
