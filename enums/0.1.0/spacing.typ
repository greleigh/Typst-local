/// Override new paragraphs after lists, etc. Insert label <no-par>
#let enum-spacing = state("__enum-spacing", (none, none))

#let update-value(new) = enum-spacing.update(((v, d)) => (new, d))


#let init(default: none, equations: false, doc) = {
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

  show math.equation: it => {
    if equations {
      space-after-enum() + it + space-after-enum()
    } else {it}
  }

  doc
}
