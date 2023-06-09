## 1. ステートレス

ステートレスとは、HTTPの特徴の一つであり、サーバーがクライアントの状態を保持しないことを意味します。HTTPプロトコルでは、各リクエストは独立しており、前のリクエストやセッションの情報をサーバーが自動的に保持しないため、次のリクエストが来た際にクライアントの状態を認識することができません。

## 2. Cookie とセッション

### Cookie

Cookieは、ウェブサイトからクライアント（ブラウザ）に送信される小さなデータの塊です。Cookieはクライアント側に保存され、クライアントのリクエストごとにサーバーに送信されます。Cookieにはキーと値のペアが含まれており、サーバーはCookieを使用してクライアントの状態を識別します。

### セッション

セッションは、サーバー側でユーザーの状態を管理するための仕組みです。セッションはサーバー側に情報を保存し、クライアントにはセッションIDが割り当てられます。クライアントはセッションIDを保持し、サーバーへのリクエストごとにセッションIDを送信します。サーバーは受け取ったセッションIDに基づいて、ユーザーの状態を特定します。

### Cookie とセッションの違い

主な違いは、データの保存場所とサーバーへのデータの送信方法です。Cookieはクライアント側に保存され、サーバーへのリクエストごとに送信されます。一方、セッションはサーバー側に保存され、クライアントはセッションIDを使用してサーバーとのやり取りを行います。

また、Cookieはクライアントが自由に操作できるため、セキュリティに関して注意が必要です。一方、セッションはサーバー側に保存されているため、よりセキュアです。

### ログイン状態の実現方法

ログイン状態の実現方法は次のようになります：

1. クライアントがログイン情報を送信すると、サーバーはログイン情報を検証し、ユーザーを認証します。
2. 認証が成功した場合、サーバーはクライアントにセッション

IDを生成し、CookieにセッションIDを含めて送信します。
3. クライアントはセッションIDを保持し、次のリクエストごとにCookieにセッションIDを含めて送信します。
4. サーバーは受け取ったセッションIDに基づいてユーザーを識別し、ログイン状態を確認します。