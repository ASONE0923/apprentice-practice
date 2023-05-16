## 1. データ型

データ型とは、列ごとに格納できるデータの種類を表すものを言います。
また、以下に代表的なデータ型を載せておきます。
- 整数型（Integer）: 整数を表すデータ型であり、一般的な整数値を格納するために使用されます。例えば、INTやINTEGERがあります。
- 浮動小数点型（Floating-Point）: 実数を表すデータ型であり、小数点以下の桁数を持つ数値を格納するために使用されます。例えば、FLOATやDOUBLEがあります。
- 文字列型（String）: 文字列を表すデータ型であり、テキストデータを格納するために使用されます。例えば、CHARやVARCHARがあります。CHARは固定長の文字列を表し、VARCHARは可変長の文字列を表します。
- 日付型（Date）: 日付を表すデータ型であり、年、月、日の情報を格納するために使用されます。例えば、DATEやDATETIMEがあります。DATEは年月日を表し、DATETIMEは年月日と時間を表します。

## 2. NULL

NULLとはテーブルの中のデータにて「どのような値も格納されていない」状態のものを言います。0とNULLでは以下のような違いがあります。
- 入金額が「0」の場合：2月3日にコーヒーを購入。380円を出金し、入金は0円だった。
- 入金額がNULLの場合：2月3日にコーヒーを購入。380円を出金した(そもそも入金は無関係)

## 3. プライマリーキー

プライマリーキーとは行を一意に識別するための列のことで、他の行と重複してはならず、必ず値が格納されていなければならないという条件が設けられています。つまり「その列の値を指定すれば、どの1行のことか完全に特定できる」という役割を与えられている列ということです。

## 4. 初期値

初期値とは、INSERT文で具体的な値を指定しない列に格納される特定のデフォルト値のことです。

## 5. AUTO INCREMENT

AUTO_INCREMENT（またはIDENTITY列とも呼ばれる）は、SQLデータベースで使用される特定の属性です。AUTO_INCREMENTは、主キーや一意の識別子として使用される列に適用されます。これにより、データベースは自動的に一意の値を生成し、新しい行が追加されるたびに値を増加させることができます。

## 6. 外部キー制約

外部キー制約とは、参照元のテーブルの外部キー列に制約をつけて、参照整合性が崩れるようなデータ操作をした場合にエラーが発生するようにする制約のことを言います。

## 7. ユニークキー制約

ユニークキー制約とは、ある列の内容が重複してはならない場合に用いる制約のことです。

## 8. テーブル定義

了解しました。以下に、簡単なECサイトのテーブル定義の例を示します。

テーブル：users

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int(11)|NO|PRIMARY||YES|
|name|varchar(100)|NO||||
|email|varchar(100)|NO|UNIQUE|||
|password|varchar(100)|NO||||
|created_at|timestamp|NO||CURRENT_TIMESTAMP||

テーブル：products

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int(11)|NO|PRIMARY||YES|
|name|varchar(100)|NO||||
|description|text|YES||||
|price|decimal(10,2)|NO||||
|created_at|timestamp|NO||CURRENT_TIMESTAMP||

テーブル：orders

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int(11)|NO|PRIMARY||YES|
|user_id|int(11)|NO|INDEX|||
|total_price|decimal(10,2)|NO||||
|created_at|timestamp|NO||CURRENT_TIMESTAMP||

- 外部キー制約：user_id に対して、users テーブルの id カラムから設定

テーブル：order_items

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int(11)|NO|PRIMARY||YES|
|order_id|int(11)|NO|INDEX|||
|product_id|int(11)|NO|INDEX|||
|quantity|int(11)|NO||||
|subtotal|decimal(10,2)|NO||||
|created_at|timestamp|NO||CURRENT_TIMESTAMP||

- 外部キー制約：order_id に対して、orders テーブルの id カラムから設定
- 外部キー制約：product_id に対して、products テーブルの id カラムから設定

この例では、ユーザー（users）、商品（products）、注文（orders）、注文商品（order_items）の4つのテーブルを考慮しています。

以下にそれぞれのテーブルについて説明します。

1. テーブル: users
   - このテーブルは、ECサイトのユーザー情報を格納します。
   - カラム:
     - id: ユーザーの一意の識別子です。
     - name: ユーザーの名前です。
     - email: ユーザーのメールアドレスです。
     - password: ユーザーのパスワードです。
     - created_at: ユーザーが作成された日時です。

2. テーブル: products
   - このテーブルは、ECサイトの商品情報を格納します。
   - カラム:
     - id: 商品の一意の識別子です。
     - name: 商品の名前です。
     - description: 商品の詳細な説明です。
     - price: 商品の価格です。
     - created_at: 商品が作成された日時です。

3. テーブル: orders
   - このテーブルは、ECサイトの注文情報を格納します。
   - カラム:
     - id: 注文の一意の識別子です。
     - user_id: 注文を行ったユーザーの識別子です。
     - total_price: 注文の合計金額です。
     - created_at: 注文が作成された日時です。

4. テーブル: order_items
   - このテーブルは、ECサイトの注文商品の情報を格納します。
   - カラム:
     - id: 注文商品の一意の識別子です。
     - order_id: 注文の識別子です。
     - product_id: 商品の識別子です。
     - quantity: 注文された商品の数量です。
     - subtotal: 注文商品ごとの小計金額です。
     - created_at: 注文商品が作成された日時です。
