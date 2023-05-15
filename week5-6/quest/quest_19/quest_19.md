## 1. 第一正規形

[購入履歴テーブル]

- 購入履歴ID
- 購入者ID
- 購入者名
- 購入商品ID
- 購入商品名
- 商品価格
- 日付

プライマリーキー：購入履歴ID,購入者ID,購入商品ID

[カテゴリーテーブル]

- 購入履歴ID(FK)
- カテゴリーID
- カテゴリー名

プライマリーキー：カテゴリーID

## 2. 第二正規形

[商品テーブル]

- 商品ID
- 商品名
- カテゴリー(FK)
- 商品価格

プライマリーキー：商品ID

[購入履歴テーブル]

- 購入履歴ID
- 日付
- 購入者ID
- 購入者名
- 購入商品ID(FK)

プライマリーキー：購入履歴ID,購入者ID

[カテゴリー]

- カテゴリーID
- カテゴリー名

プライマリーキー：カテゴリーID

## 3. 第三正規形

[ユーザーテーブル]

- ユーザーID
- ユーザー名
- メールアドレス
- パスワード
- 連絡先情報

プライマリーキー：ユーザーID

[商品テーブル]

- 商品ID
- 商品名
- カテゴリー(FK)
- 商品価格

プライマリーキー：商品ID

[購入履歴テーブル]

- 購入履歴ID
- 日付
- 購入者ID(FK)
- 購入商品ID(FK)

プライマリーキー：購入履歴ID

[カテゴリー]

- カテゴリーID
- カテゴリー名

プライマリーキー：カテゴリーID

## 4. ボイスコッド正規形

[患者テーブル]

- 患者ID
- 患者名
- 連絡先情報

プライマリーキー：患者ID

[診療科テーブル]

- 診療科ID
- 診療科名
- 診療科情報

プライマリーキー：診療科ID

[医師テーブル]

- 医師ID
- 医師名
- 医師情報
- 診療科名(FK)

プライマリキー：医師ID

[担当医師と患者の関連テーブル]

- 患者ID(FK)
- 診療科ID(FK)

プライマリーキー：患者ID,診療科ID