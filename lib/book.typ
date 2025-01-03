#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/roremu:0.1.0": roremu
#import "@preview/hydra:0.5.1": hydra

#let font-san-serif = "Harano Aji Gothic"
#let font-seif = ("Times Newer Roman", "Harano Aji Mincho")
#let font-monospace = "HackGen Console NF"

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
    header: context {
      hydra(1, skip-starting: true)
      h(1fr)
      [#counter(page).display()]
      line(length: 100%)
    },
    footer: none,
    columns: 1,
  )

  set text(lang: "ja", font: font-seif, size: 10pt)
  show strong: set text(font: font-san-serif)
  show raw: set text(font: font-monospace)

  set par(justify: true, first-line-indent: 1em, leading: 1em, spacing: 1em)

  // heading
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    pagebreak()
    set text(weight: "bold", size: 22pt)
    if it.numbering != none {
      [
        // use block in order to have effect (`skip-starting`)
        #block()
        #v(4em)
        第
        #numbering(it.numbering, ..counter(heading).at(it.location()))
        章 \
      ]
    } else {
      block()
      v(4em)
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
  set list(marker: [・])
  show bibliography: set text(lang: "en")

  // cover
  {
    set align(center)
    set page(header: none)
    set text(size: 12pt)
    header
    v(1fr)
    set text(size: 17pt)
    title
    v(1fr)
    set text(size: 12pt)
    set align(right)
    [#affiliation \
      #id #author]
  }

  counter(page).update(1)

  // toc
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    show: strong
    show regex("\d "): it => {
      [第] + it + [章]
      h(1em)
    }
    it.body
    h(1fr)
    it.page
  }
  outline(title: [目次], depth: 3, indent: 2em)
  doc
}
