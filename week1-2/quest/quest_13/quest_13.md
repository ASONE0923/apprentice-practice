# 1. 例外
## 例外とは何か
想定通り処理が進まなかっりエラーが起きてしまうこと。
「例外」という用語の解釈には、「エラー」、「想定内のエラー」、「それ以外」の解釈の3つがあります

## 何のためにあるのか
上記のような不測の事態の時に活躍するのが例外処理という仕組みです。
正常な処理と、例外的な処理とを分けて書くことで、プログラムの可読性を向上させることができます。
Rubyの例外処理を記述するには、begin～rescue～end構文を使います。
beginとrescueの間に例外が起こるかも知れない処理を記述し、rescueとendの間に例外が発生した時の処理を記述してください。

```ruby:begin～rescue～endの基本構文
begin
例外が起こるかも知れない処理
rescue
例外が発生した時の処理
end
```