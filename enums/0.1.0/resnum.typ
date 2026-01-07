// Resumable enums

/// Allow enumerates to resume counting
/// (how to do this ...?)
// State to resume enumerates. Insert label <no-par>
#let resume-enum = state("__resume-enum", false)
#let current-enum = counter("__current-enum")

#let init(..options, doc) = {
  show <resume-enum>: it => { resume-enum.update(true) + it }
  show enum.item: it => {
    if type(it.number) == int {
      current-enum.update(it.number)
    } else {
      current-enum.step()
    }
    it
  }
  show enum: it => {
    // determine whether to resume previous counting
    let resume = resume-enum.get()
    resume-enum.update(false)
    // set enum(start: auto)
    if type(it.start) == int or resume != true {
      it
    } else {
      // start == auto && resume == true
      let args = it.fields()
      let (start: os, children: items, ..args) = it.fields()
      let new-start = current-enum.get().first() + 1
      // current-enum.update(0) // why does this matter?
      enum(..args, start: new-start, ..items)
    }
    current-enum.update(0) // why does this matter?
  }
  doc
}
