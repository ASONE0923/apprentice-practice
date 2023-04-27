# パーミッションを操作できる

## 1. ファイルのオーナーとグループ

[![Image from Gyazo](https://i.gyazo.com/8b076d7dd6d7180eb38b85054f513c4d.png)](https://gyazo.com/8b076d7dd6d7180eb38b85054f513c4d)

## 2. ファイルのパーミッション

- 先頭の-は通常ファイルを表しており、ファイルタイプの後ろ9文字、rw-rw-r--はファイルモードと呼ばれこれによりファイルのパーミッション（誰にどのような操作を許可するか）を表しています。
- この9文字はrw-、rw-、r--というふうに3つのブロックに分かれていてそれぞれ「オーナー」、「グループ」、「その他のユーザ」に対するパーミッションを意味しています。
- 「r」は読み取り、「w」は書き込み、「x」は実行を表しています。つまりrw-rw-r--は、オーナー&グループは読み取り・書き込みの許可、その他のユーザは書き込みのみ許可というふうに抱えrていることがわかります。

## 3. ファイルのパーミッションの設定

[![Image from Gyazo](https://i.gyazo.com/1374d537f639fc74e366a36034fb418d.png)](https://gyazo.com/1374d537f639fc74e366a36034fb418d)

## 4. ディレクトリのパーミッションの設定

[![Image from Gyazo](https://i.gyazo.com/f84c78cdf2c38c2f445f14fbe697d123.png)](https://gyazo.com/f84c78cdf2c38c2f445f14fbe697d123)

## 5. スーパーユーザー

[![Image from Gyazo](https://i.gyazo.com/e92a0b009e6eae990fd3ced337393a00.png)](https://gyazo.com/e92a0b009e6eae990fd3ced337393a00)