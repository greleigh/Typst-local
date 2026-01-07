/// Override new paragraphs after lists, etc. Insert label <no-par>
#let block-in-paragraph = state("block-in-paragraph", (none, none))

#let update-value(new) = block-in-paragraph.update(((v, d)) => (new, d))

#let space-after-block() = {
  context {
    let (toggle, _) = block-in-paragraph.get()
    if toggle == none {
      toggle = true
    }
    if toggle == none {} else if toggle {
      v(par.leading, weak: true)
    } else {
      v(par.spacing, weak: true)
    }
  }
  update-value(none)
}

#let init(default: none, doc) = {
  block-in-paragraph.update((none, default))

  /// New show rules for `enum`, `list` and `terms`
  show selector(enum).or(list).or(terms): it => { it + space-after-block() }

  doc
}
