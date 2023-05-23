## ステップ2

1. データベースの構築
- 適切なデータベース管理システム（例: MySQL、PostgreSQL）を選択し、データベースを作成します。
- データベース名を選び、作成します。
```sql:データベースの作成
CREATE DATABASE internet_tv_service;
```
- データベース名を指定して USE コマンドを使用します。

```sql
USE internet_tv_service;
```

2. ステップ1で設計したテーブルの構築
- データベース内に必要なテーブルを作成します。
  - 必要に応じて、テーブル内のカラムに対してユニークキー制約を設定します。
 
- テーブル間の関連付け
  - 外部キー制約を使用して、テーブル間の関連付けを設定します。

- 以下は、各テーブルの作成に関するクエリです。

テーブル: チャンネル
```sql
CREATE TABLE チャンネル (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  名前 VARCHAR(100) UNIQUE
);
```

テーブル: 番組枠
```sql
CREATE TABLE 番組枠 (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  チャンネルID BIGINT(20),
  番組ID BIGINT(20),
  開始時間 DATETIME,
  終了時間 DATETIME,
  FOREIGN KEY (チャンネルID) REFERENCES チャンネル(id),
  FOREIGN KEY (番組ID) REFERENCES 番組(id)
);
```

テーブル: 番組
```sql
CREATE TABLE 番組 (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  タイトル VARCHAR(100),
  詳細 TEXT,
);
```

テーブル: シーズン
```sql
CREATE TABLE シーズン (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  番組ID BIGINT(20),
  シーズン番号 BIGINT(20),
  FOREIGN KEY (番組ID) REFERENCES 番組(id)
);
```

テーブル: エピソード
```sql
CREATE TABLE エピソード (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  シーズンID BIGINT(20),
  番組ID BIGINT(20),
  エピソード番号 BIGINT(20),
  タイトル VARCHAR(100),
  詳細 TEXT,
  動画時間 INT,
  公開日 DATE,
  FOREIGN KEY (番組ID) REFERENCES 番組(id),
  FOREIGN KEY (シーズンID) REFERENCES シーズン(id),
   視聴数 INT DEFAULT 0,
);
```

テーブル: ジャンル
```sql
CREATE TABLE ジャンル (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  名前 VARCHAR(100)
);
```

テーブル: 番組ジャンル
```sql
CREATE TABLE 番組ジャンル (
  番組ID BIGINT(20),
  ジャンルID BIGINT(20),
  FOREIGN KEY (番組ID) REFERENCES 番組(id),
  FOREIGN KEY (ジャンルID) REFERENCES ジャンル(id)
);
```

テーブル: エピソード視聴数
```sql
CREATE TABLE エピソード視聴数 (
  id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
  エピソードID BIGINT(20),
  チャンネルID BIGINT(20),
  番組枠ID BIGINT(20),
  視聴数 INT DEFAULT 0,
  FOREIGN KEY (エピソードID) REFERENCES エピソード(id),
  FOREIGN KEY (チャンネルID) REFERENCES チャンネル(id),
  FOREIGN KEY (番組枠ID) REFERENCES 番組枠(id)
);
```
上記のサンプルクエリを参考に、各テーブルの作成を行ってください。


3. サンプルデータの導入
- 各テーブルに必要なデータを挿入します。
  - chatgptにサンプルデータを作成してもらいます。
- INSERT文を使用してデータを追加します。
  - 以下に、サンプルデータを挿入するためのSQLクエリを示します。

以下に、各テーブルにサンプルデータを挿入するためのクエリを示します。各テーブルのカラムに適した値を使用して、必要に応じてクエリを調整してください。

1. テーブル: チャンネル

```sql
INSERT INTO チャンネル (id, 名前)
VALUES (1, 'チャンネルA'),
       (2, 'チャンネルB'),
       (3, 'チャンネルC');
```

2. テーブル: 番組枠

```sql
INSERT INTO 番組枠 (id, チャンネルID, 番組ID, 開始時間, 終了時間)
VALUES (1, 1, 1, '2023-05-20 10:00:00', '2023-05-20 11:00:00'),
       (2, 1, 2, '2023-05-20 12:00:00', '2023-05-20 13:00:00'),
       (3, 2, 3, '2023-05-20 14:00:00', '2023-05-20 15:00:00');
```

3. テーブル: 番組

```sql
INSERT INTO 番組 (id, タイトル, 詳細)
VALUES (1, '番組A', '番組Aの詳細'),
       (2, '番組B', '番組Bの詳細'),
       (3, '番組C', '番組Cの詳細');
```

4. テーブル: シーズン

```sql
INSERT INTO シーズン (id, 番組ID, シーズン番号)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 1);
```

5. テーブル: エピソード

```sql
INSERT INTO エピソード (id, シーズンID, 番組ID, エピソード番号, タイトル, 詳細, 動画時間, 公開日,視聴数)
VALUES (1, 1, 1, 1, 'エピソード1', 'エピソード1の詳細', 1800, '2023-05-20',1600),
       (2, 1, 1, 2, 'エピソード2', 'エピソード2の詳細', 1500, '2023-05-27',1500),
       (3, 2, 2, 1, 'エピソード1', 'エピソード1の詳細', 2100, '2023-06-03',1000);
```

6. テーブル: ジャンル

```sql
INSERT INTO ジャンル (id, 名前)
VALUES (1, 'ドラマ'),
       (2, 'アニメ'),
       (3, 'バラエティ');
```

7. テーブル: 番組ジャンル

```sql
INSERT INTO 番組ジャンル (番組ID, ジャンルID)
VALUES (1, 1),
       (2, 2),
       (3, 3);
```

8. テーブル: エピソード視聴数

```sql
INSERT INTO エピソード視聴数 (id, エピソードID, チャンネルID, 番組枠ID, 視聴数)
VALUES (1, 1, 1, 1, 1000),
       (2, 1, 2, 2, 500),
       (3, 2, 1, 1, 800);
```

上記のクエリを使用して、各テーブルにサンプルデータを挿入できます。必要に応じてテーブル名やカラム名を適切なものに変更してください。また、サンプルデータの値や数は必要に応じて調整してください。