#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/roremu:0.1.0": roremu

#let font-san-serif = "Harano Aji Gothic"
#let font-seif = ("Times Newer Roman", "Harano Aji Mincho")
#let font-monospace = "HackGen Console NF"

// 目次、ページ番号

#let conf(
  header: "Book header",
  title: "Book title",
  affiliation: "Yout affiliation",
  author: "Your name",
  id: "Student id",
  doc,
) = {
  show: codly-init.with()
  codly(zebra-fill: none, stroke: 1pt + gray)
  set page(
    margin: (
      top: 3.5cm,
      bottom: 3.5cm,
      left: 2.5cm,
      right: 2.5cm,
    ),
    numbering: "1",
    columns: 1,
  )

  set text(lang: "ja", font: font-seif, size: 10pt)
  show strong: set text(font: font-san-serif)
  show raw: set text(font: font-monospace)

  set par(justify: true, first-line-indent: 1em, leading: 1em, spacing: 1em)
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    pagebreak()
    set text(weight: "bold", size: 22pt)
    if it.numbering != none {
      [
        #v(4em)
        第
        #numbering(it.numbering, ..counter(heading).at(it.location()))
        章 \
      ]
    }
    [
      #it.body \
      #v(2em)
    ]
  }

  show heading.where(level: 2): set heading(numbering: "1.1" + " " * 4)
  show heading.where(level: 2): set text(size: 16pt)

  show heading: it => {
    set text(size: 14pt, font: font-san-serif)
    it
    par(text(size: 0em, ""))
  }

  show figure.where(kind: table): set figure.caption(position: top)
  show bibliography: it => {
    show heading: it => {
      strong(it)
    }
    it
  }

  set list(marker: [・])

  {
    set align(center)
    set page(numbering: none)
    set text(size: 12pt)
    header
    v(1fr)
    set text(size: 17pt)
    title
    v(1fr)
    set text(size: 12pt)
    set align(right)
    [#affiliation \
      #id + #author]
  }

  counter(page).update(1)
  doc
}
