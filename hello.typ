#import "@preview/roremu:0.1.0": roremu
#import "conf.typ": conf
#show: conf.with(
  title: [
    My very first typst project
  ],
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (
      name: "Eugene Deklan",
      affiliation: "Honduras State",
      email: "e.deklan@hstate.hn",
    ),
  ),
  abstract: roremu(80),
)


= Intro
hogeghoewa

== Related Work
focke fuck hock
#roremu(128)

= なぜ笑うんだい？
#roremu(500)

= 結論
Latexつかいたくない。

#let hoge = (1, 2, 3)
#{
  let huga = hoge.map(it => [#{ it * 2 }])
  huga
}


#set style(
  list,
  (
    item-spacing: 0pt,
    item-indent: 20pt,
  ),
)
