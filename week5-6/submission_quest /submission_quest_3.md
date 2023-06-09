## ステップ3

以下のデータを抽出するクエリを書いてください。

1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
```sql
SELECT エピソード.タイトル, エピソード視聴数.視聴数
FROM エピソード
INNER JOIN エピソード視聴数 ON エピソード.id = エピソード視聴数.エピソードID
ORDER BY エピソード視聴数.視聴数 DESC
LIMIT 3;
```
2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
```sql
SELECT
  番組.タイトル AS 番組タイトル,
  COUNT(DISTINCT シーズン.id) AS シーズン数,
  COUNT(エピソード.id) AS エピソード数,
  エピソード.タイトル AS エピソードタイトル,
  SUM(エピソード視聴数.視聴数) AS 視聴数
FROM
  番組
  INNER JOIN エピソード ON 番組.id = エピソード.番組ID
  INNER JOIN シーズン ON 番組.id = シーズン.番組ID
  INNER JOIN エピソード視聴数 ON エピソード.id = エピソード視聴数.エピソードID
GROUP BY
  番組.id, シーズン.id, エピソード.id, エピソード.タイトル
ORDER BY
  視聴数 DESC
LIMIT 3;
```
3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
```sql
SELECT
  チャンネル.名前 AS チャンネル名,
  番組枠.開始時間 AS 放送開始時刻,
  MAX(番組枠.終了時間) AS 放送終了時刻,
  COUNT(DISTINCT シーズン.id) AS シーズン数,
  COUNT(エピソード.id) AS エピソード数,
  エピソード.タイトル AS エピソードタイトル,
  エピソード.詳細 AS エピソード詳細
FROM
  番組枠
  INNER JOIN チャンネル ON 番組枠.チャンネルID = チャンネル.id
  INNER JOIN 番組 ON 番組枠.番組ID = 番組.id
  INNER JOIN シーズン ON 番組.id = シーズン.番組ID
  INNER JOIN エピソード ON シーズン.id = エピソード.シーズンID
WHERE
  DATE(番組枠.開始時間) = CURDATE() 
GROUP BY
  チャンネル.id, 番組枠.開始時間, エピソード.id, エピソード.タイトル, エピソード.詳細
ORDER BY
  番組枠.開始時間 ASC;
```
4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
```sql
SELECT
  番組枠.開始時間 AS 放送開始時刻,
  MAX(番組枠.終了時間) AS 放送終了時刻,
  COUNT(DISTINCT シーズン.id) AS シーズン数,
  COUNT(エピソード.id) AS エピソード数,
  エピソード.タイトル AS エピソードタイトル,
  エピソード.詳細 AS エピソード詳細
FROM
  番組枠
  INNER JOIN チャンネル ON 番組枠.チャンネルID = チャンネル.id
  INNER JOIN 番組 ON 番組枠.番組ID = 番組.id
  INNER JOIN シーズン ON 番組.id = シーズン.番組ID
  INNER JOIN エピソード ON シーズン.id = エピソード.シーズンID
WHERE
  チャンネル.名前 = 'ドラマ'
  AND DATE(番組枠.開始時間) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY) -- 本日から一週間分の番組を取得
GROUP BY
  番組枠.開始時間, エピソード.id, エピソード.タイトル, エピソード.詳細
ORDER BY
  番組枠.開始時間 ASC;
```
5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
```sql
SELECT
  番組.タイトル AS 番組タイトル,
  SUM(エピソード視聴数.視聴数) AS 視聴数
FROM
  番組
  INNER JOIN エピソード ON 番組.id = エピソード.番組ID
  INNER JOIN エピソード視聴数 ON エピソード.id = エピソード視聴数.エピソードID
WHERE
  DATE(エピソード.公開日) BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() -- 直近一週間の番組を取得
GROUP BY
  番組.id
ORDER BY
  視聴数 DESC
LIMIT 2;

```
6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
```sql
SELECT
  ジャンル.名前 AS ジャンル名,
  番組.タイトル AS 番組タイトル,
  AVG(エピソード視聴数.視聴数) AS エピソード平均視聴数
FROM
  番組
  INNER JOIN 番組ジャンル ON 番組.id = 番組ジャンル.番組ID
  INNER JOIN ジャンル ON 番組ジャンル.ジャンルID = ジャンル.id
  INNER JOIN エピソード ON 番組.id = エピソード.番組ID
  INNER JOIN エピソード視聴数 ON エピソード.id = エピソード視聴数.エピソードID
GROUP BY
  ジャンル.id, 番組.id
HAVING
  AVG(エピソード視聴数.視聴数) IS NOT NULL
ORDER BY
  AVG(エピソード視聴数.視聴数) DESC;
```