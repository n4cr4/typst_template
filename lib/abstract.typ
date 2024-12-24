#let conf(
  header: "Abstract header",
  title: "Paper title",
  author: "Your name",
  id: "Student id",
  doc,
) = {
  set page(
    margin: (
      top: 1.5cm,
      bottom: 1cm,
      left: 1.5cm,
      right: 1.5cm,
    ),
    numbering: "1",
    columns: 2,
  )
  set text(lang: "ja", font: "MS Mincho", size: 10pt)
  show strong: set text(font: "MS Gothic")
  set par(justify: true, first-line-indent: 1em, leading: 0.7em, spacing: 0.8em)
  set heading(numbering: "1.1 ")
  show heading: it => {
    v(1em, weak: true)
    set text(size: 13pt - 1.3pt * (it.depth))
    strong(it)
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

  show raw: it => {
    set text(font: ("Noto Sans", "MS Gothic"))
    it
  }
  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
  )[
    #header \
    #v(12pt)
    #{
      set text(size: 14.4pt)
      strong(title)
    } \
    #v(2pt)
    #{
      set text(size: 14.4pt)
      box(author)
    } \
    #{
      set text(size: 12pt)
      id
    }
  ]
  doc
}
