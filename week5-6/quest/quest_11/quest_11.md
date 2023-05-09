## 6. 内部結合と外部結合の違い
- 内部結合は二つのテーブルの共通の値をもつレコードを結合する方法です。イメージ的には結合箇所に橋をかける感じです。
内部結合は、JOIN 句と ON 句を使用して行います。結合する際に共通の値を持つカラム名を指定し、そのカラム名の値が一致するレコードを結合します。
以下は、従業員テーブル employees と給与テーブル salaries を従業員番号 emp_no を共通項目として内部結合する例です。
```sql
SELECT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;
```

- 外部結合は、結合する二つのテーブルにおいて、片方のテーブルにあってもう片方のテーブルには存在しないデータも取得したい場合に使用します。
外部結合は、LEFT JOIN、RIGHT JOIN、FULL OUTER JOINというキーワードを使用して実行します。以下は、従業員テーブル employees と給与テーブル salaries を従業員番号 emp_no を共通項目として左外部結合する例です。
```sql
SELECT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;
```

- まとめると内部結合は、結合条件に合致するデータだけを取得し、外部結合は、結合条件に合致しないデータも含めて取得するという違いがあります。