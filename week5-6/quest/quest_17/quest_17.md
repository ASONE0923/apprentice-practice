## 1. 論理設計

概念設計で明らかになった各情報について、RDBを使う前提で構造を整理し、詳しく具体化していく工程です。具体的にはどのようなテーブルを作り、それぞれのテーブルにどのような列を作るかまで明らかにします。

## 2. 物理設計

特定のDBMS製品を使う前提に立ち、論理設計にて明らかになった各テーブルについて、その内容を詳しく具体化していきます。全てのテーブルのすべての列について、型、インデックス、製薬、デフォルト値など、テーブル作成に必要なすべての要素を確定させます。

## 3. エンティティ

概念設計では、要件を実現させるために抽象的な概念としてどのような情報の塊を管理しなければならないのかを明らかにします。この情報の塊のことをエンティティと言います。

## 4. 正規化

正規化とは、矛盾したデータを格納できないよう、テーブルを複数に分割していく作業を言います。

## 5. ER 図

ER図とは概念設計の成果をまとめたものです。ER図を使うことで、エンティティ、属性、リレーションシップを俯瞰して見ることができます。

## 6. テーブル定義

テーブル定義は、データベース内のテーブルの構造を定義するプロセスまたは情報のことを指します。テーブル定義では、テーブルの名前、列（フィールド）の数とデータ型、制約（主キー、外部キー、一意制約など）、デフォルト値、インデックスなどの属性が指定されます。

## 7. インデックス

インデックスとはデータベースで作成することのできる索引情報のことです。特徴としてインデックスは指定した列に対して作られ、検索を早くすることができます。