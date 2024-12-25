#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/roremu:0.1.0": roremu

#let font-san-serif = "Harano Aji Gothic"
#let font-seif = ("Times Newer Roman", "Harano Aji Mincho")
#let font-monospace = "HackGen Console NF"

#let conf(
  title: "Main title",
  sub_title: "Sub title",
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
    columns: 2,
  )

  set text(lang: "ja", font: font-seif, size: 10pt)
  show strong: set text(font: font-san-serif)
  show raw: set text(font: font-monospace)

  set par(justify: true, first-line-indent: 1em, leading: 1em, spacing: 1em)
  set heading(numbering: "1.1 ")
  show heading: it => {
    set text(size: 13pt - 1.5pt * (it.depth), font: font-san-serif)
    it
    v(1em, weak: true)
    box()
    h(1em, weak: true)
  }

  show figure.where(kind: table): set figure.caption(position: top)
  show bibliography: it => {
    show heading: it => {
      strong(it)
      v(0.1em, weak: true)
    }
    it
  }

  set list(marker: [・])
  show list: it => {
    v(0em, weak: true)
    it
  }

  show enum: it => {
    v(0em, weak: true)
    it
  }

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 4em,
  )[
    #v(4em)
    #{
      set text(size: 15pt)
      title
    } \
    #{
      set text(size: 9pt)
      sub_title
    } \
    #v(8pt)
    #{
      set text(size: 12pt)
      box(id + author)
    } \
    #v(8pt)
    #{
      set text(size: 12pt)
      datetime.today().display("[year]年[month]月[day]日")
    }
  ]
  doc
}
