
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let uw-homework-article(
  title: none,
  course: none,
  date: none,
  author: none,
  affiliation: none,
  email: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "New Computer Modern",
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  show heading: set text(font: "Calibri")
  show heading.where(level: 1): h => [
    #h
    #v(-1em)
    #line(length: 100%, stroke: .5pt)
  ]
  show heading.where(level: 3): set text(size: fontsize, 
                                         weight: "medium", 
                                         style: "oblique")

  show math.equation: set text(font: "New Computer Modern Math")

  if title != none {
    set text(style: "italic", size: fontsize, font: "Calibri")
    grid(columns: (1fr, 1fr),
      align(left)[
        #text(weight: "bold", style: "normal", 
              size: 1.5em, font: "Sitka Banner")[#title] \
        #date \ #course
      ],
      align(right)[
        #text(weight: "bold", size: 1.5em, font: "Sitka Banner")[#author] \
        #affiliation \ #email
      ],
      v(1em)
    )
  }  

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }

}

#let problem(body) = {
  set text(font: "Sitka Text")
  align(center,
    rect(
      stroke: luma(0),
      inset: 16pt,
      outset: -8pt, 
      radius: 4pt,
      align(left,
        [#body],
      )
    )
  )
}

#show raw: code => box(
  text(font: "Cascadia Code")[#code],
)

#let proof(body) = block(spacing: 11.5pt, {
  emph[Proof.]
  [ ] + body
  h(1fr)
  box(scale(160%, origin: bottom + right, sym.square.stroked))
})
