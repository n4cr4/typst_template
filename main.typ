
// #import "lib/abstract.typ": *
// #show: conf.with(
//   header: [卒業論文概要（hoge大学 fuga部 bar学科 ぬるぽ研究室）],
//   title: [革新的アプローチ],
//   author: [卒論noob],
//   id: [0xdeadbeef],
// )
// #import "lib/resume.typ": *
// #show: conf.with(
//   title: [適当なゼミ 第n回],
//   sub_title: [革新的アプローチ],
//   author: [卒論noob],
//   id: [0xdeadbeef],
// )
#import "lib/book.typ": *
#show: conf.with(
  header: [おそまつ 卒業論文],
  title: [革新的アプローチ],
  affiliation: [ぬるぽ研究室],
  author: [卒論noob],
  id: [0xdeadbeef],
)

= 論文作成
論文発表では、研究を発表する際に概要を作成しなくてはなりません。でも、Latexで書くと記述が即時反映されず、コンパイルをしてみたらエラーで落ちることも多々あります。LSPの精度もいまいちで、クリティカルなエラーがコードに対応していないこともあります。Typst @typst は、そのような問題を解決するために開発されました。

Latexにうんざりしたそこのあなた。Typstというモダンな組版ツールを使ってみませんか？
必要な設定は,`conf.typ`に記述されています。

== 使用方法
とっても簡単です。
`conf.typ`に記述されている設定を読み込みます。
```typ
#import "conf.typ": conf
```
設定に引数を与えて有効化しましょう。`conf.with`を使います。
```typ
#show: conf.with(
  header: [卒業論文概要（hoge大学 fuga部 bar学科 ぬるぽ研究室）)],
  title: [革新的アプローチ],
  author: [卒論noob],
  id: [0xdeadbeef],
)
```

ちなみに、Typstのロゴは @typst-logo の通りです。

= Typstのここがすごい！
== とくにすごい
+ 高速なコンパイル
+ 可読性の高い記法
+ プレビュー機能
+ Forward search, Inverse search

= Typstのここがしんどい
- ドキュメントが少ない
- 日本語のライブラリが少ない

ただし、これらの弱点は日本語版公式ドキュメント @typst-ja によってある程度克服できます。

= Latexとの文法比較
Latexの文法をTypstで書き換えると、以下のようになります。

#table(
  columns: (1fr, 1fr),
  table.header([*Latex*], [*Typst*]),
  [`\textbf{strong}`], [`*strong*`],
  [`\emph{emphasis}`], [`_emphasis_`],
  [`\texttt{print(1)}`], [#raw("`print(1)`")],
  [`\url{https://typst.app}`], [`https://typst.app/`],
  [`\label{intro}`], [`<intro>`],
  [`\ref{intro}`], [`@intro`],
  [`\cite{humphrey97}`], [`@humphrey97`],
  [itemize environment], [`- List`],
  [enumerate environment], [`+ List`],
  [description environment], [`/ Term: List`],
  [figure environment], [figure function],
  [table environment], [table function],
  [`$x$`], [`$ x = y $`],
)

他にも対応があるので公式のドキュメントを参照してください。

= モード
TypstはLatexと異なり、モードを持ちます。
モードには、以下の3つがあります。
/ Code: プログラムコードを記述するモード。`#`で始まる行はコードとして解釈されます。例えば`#(1 + 1)`は`2`と評価されます。

/ Math: 数式を記述するモード。`$`で囲まれた部分は数式として解釈されます。例えば`$-x$`は$-x$と表示されます。
/ Markup: マークアップを記述するモード。`[ ]`で囲まれた部分はマークアップとして解釈されます。例えば`[*Hello*]`は*Hello*と表示されます。

#figure(
  placement: bottom,
  image("assets/logo.png", width: 40%),
  caption: "Typstのロゴ",
) <typst-logo>

= おわりに
いつまでLatexつかってんだよ！
参考サイト @アカデミックヤク83:online をよく読みながら、まず序文を完成させる。

#bibliography("ref.bib", title: [参考文献])
