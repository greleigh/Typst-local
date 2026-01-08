// Resumable enums

/// Allow enumerates to resume counting
/// (how to do this ...?)
// State to resume enumerates. Insert label <no-par>
#let resume-enum = state("__resume-enum", false)
#let current-enum = counter("__current-enum")

#let init(..options, doc) = {
  show <resume-enum>: it => { resume-enum.update(true) + it }
  // show <show-enum>: it => { it + context current-enum.get() } // Debug

  
  show enum: it => {
    // determine whether to resume previous counting
    let resume = resume-enum.get()
    let (start: s, children: items, ..args) = it.fields()
    resume-enum.update(false)
    if type(s) == int {
      // Override if `enum.start` is specified
      current-enum.update(s) 
      it
    } else if resume != true {
      current-enum.update(1)
      it
    } else {
      // start == auto && resume == true
      let new-start = current-enum.get().first()
      enum(..args, start: new-start, ..items)
    }
  }

  show enum.item: it => {
    it
    if type(it.number) == int {
      current-enum.update(it.number + 1)
    } else {
      current-enum.step()
    }
  }
  doc
}
