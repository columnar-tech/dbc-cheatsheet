#let cheatsheet(
  title: "",
  logo_source: "",
  docs: none,
  version: "",
  updated: none,
  body,
) = {
  set document(title: title)
  set text(font: "Inter")

  set page(
    paper: "us-letter",
    flipped: true,
    margin: 0.5in,
    columns: 3,
    footer: grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      image("assets/columnar.svg", height: 10pt),
      [
        #set text(size: 6pt)

        © 2025 Columnar Technologies Inc.
        • #link("https://creativecommons.org/licenses/by-sa/4.0/")[CC BY-SA 4.0]
        • #link("https://columnar.tech/")[columnar.tech]
        • Learn more at #docs
        • #version
        • Updated: #updated.display("[year]-[month]")
      ],
    ),
  )

  show heading: it => {
    line(length: 100%, stroke: 1pt + gray)
    text(weight: "medium")[#it.body]
  }

  let code_background = luma(240)
  show raw: set text(font: "JetBrains Mono")
  show raw.where(block: false): box.with(
    fill: code_background,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true, lang: "console"): it => block(
    fill: code_background,
    inset: 6pt,
    radius: 2pt,
    width: 100%,
    [#text(fill: code_background.darken(33%))[\$] #it.text],
  )

  place(
    top,
    float: true,
    scope: "parent",
    clearance: 1.5em,
    {
      let text_size = 20pt
      set text(size: text_size)
      grid(
        columns: (1fr, auto),
        align: (left, right),
        text(weight: "light")[#title : : ] + text(size: 0.8em, weight: "medium")[CHEATSHEET],
        image(logo_source, height: text_size),
      )
    },
  )

  body
}
