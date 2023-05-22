# HTML と CSSについて説明できる

## 1. HTML とは
 - HTMLとは「HyperText Markup Language」の略で、Webページの土台となるファイルを作成する言語です。Webページに表示したい文章などをタグで囲んで書いていきます。タグで囲むことによって「これはリンクで、このページに飛びます」、「ここは見出しです」というような指示を出しています。そうやってコンピュータがそのページの構造を理解できるようにすることがHTMLの役割です。

## 2. CSS とは

- CSSとは「Cascading Style Sheets」の略で、文書の見た目を装飾する言語です。

## 3. HTML と　CSS の関係
- HTMLファイルに作成したCSSファイルを読み込ませることによって適用させることができます。
CSSを適用する方法はいくつかあります。以下にいくつかの一般的な方法を示します。

1. 内部スタイルシート（Internal Style Sheet）: HTML文書の`<head>`タグ内に`<style>`タグを使用してCSSコードを埋め込む方法です。例えば以下のように記述します：

```html
<!DOCTYPE html>
<html>
<head>
  <title>ページのタイトル</title>
  <style>
    /* CSSコードをここに書く */
    h1 {
      color: blue;
    }
    p {
      font-size: 16px;
    }
  </style>
</head>
<body>
  <!-- ページのコンテンツ -->
  <h1>見出し</h1>
  <p>段落のテキスト</p>
</body>
</html>
```

2. 外部スタイルシート（External Style Sheet）: CSSコードを別のファイルに保存し、HTML文書内でリンクして使用する方法です。まず、拡張子が`.css`の新しいファイルを作成し、CSSコードをそこに保存します。次に、HTML文書の`<head>`タグ内で`<link>`タグを使用してCSSファイルを指定します。例えば：

```html
<!DOCTYPE html>
<html>
<head>
  <title>ページのタイトル</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- ページのコンテンツ -->
  <h1>見出し</h1>
  <p>段落のテキスト</p>
</body>
</html>
```

ここで、`styles.css`はCSSファイルの名前とパスです。CSSファイル内にはスタイルルールが記述されます。

3. インラインスタイル（Inline Style）: HTML要素の`style`属性を使用して直接スタイルを指定する方法です。例えば：

```html
<!DOCTYPE html>
<html>
<body>
  <!-- ページのコンテンツ -->
  <h1 style="color: blue;">見出し</h1>
  <p style="font-size: 16px;">段落のテキスト</p>
</body>
</html>
```

この方法は特定の要素に対して直接スタイルを指定する場合に便利ですが、大規模なプロジェクトでは管理が困難になる可能性があります。

これらの方法を使用して、HTML文書にCSSを適用することができます。一般的には外部スタイルシートの使用が推奨され、再利用性や保守性の向上に役立ちます。