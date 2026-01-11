/// Override new paragraphs after lists, etc. Insert label <no-par>
#let enum-spacing = state("__enum-spacing", (none, none))
#let next-block-space = state("__enum-next-block", auto)

#let update-value(new) = enum-spacing.update(((v, d)) => (new, d))


#let init(default: auto, equations: true, doc) = {
  let space-after-enum() = {
    context {
      let (c, d) = enum-spacing.get()
      if c == none {
        c = d
      }
      update-value(none)
      if c == none {} else if c {
        v(par.spacing, weak: true)
      } else {
        v(par.leading, weak: true)
      }
    }
  }
  enum-spacing.update((none, default))

  /// New show rules for `enum`, `list` and `terms`
  show selector(enum).or(list).or(terms): it => it + space-after-enum()

  // show math.equation.where(block: true): it => {
  //   // if equations {
  //   //   space-after-enum() + it + space-after-enum()
  //   // } else {it}
  //   // let below = block.below
  //   // if it.has("label") {
  //   //   if it.label == "end-par" {
  //   //     below = par.spacing
  //   //   } else if it.label == "no-par" {
  //   //     below = par.leading
  //   //   }
  //   // }
  //   // show math.equation: set block(spacing:below)
  //   let (above,below) = (block.above,block.below)
  //   let spacing = auto
  //   if equations {
  //     spacing = par.leading
  //     // spacing = par.spacing
  //   }
  //   set block(spacing: spacing)
  //   it
  // }
  show math.equation.where(block: true): it => {
    set block(spacing: par.leading) if equations
    set block(below: par.spacing) if next-block-space.get() == true
    it
    next-block-space.update(auto)
  }

  doc
}
