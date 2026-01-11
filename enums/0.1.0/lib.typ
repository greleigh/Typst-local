/// Root file for list features
///
/// Enumerations:
/// :resume counters
/// :referencable labels
///
#import "referable.typ": *
#import "resume.typ": init as enable-resume-enums
#import "spacing.typ"

///
///
/// - options (arguments): sink for used options
/// - post-spacing (none):
/// - ref-numbering ():
/// - doc ():
/// ->
#let init(..options, tight-spacing: none, include-equations: false, ref-numbering: "1.1", doc) = {
  show: enable-referable-enums
  show: enable-resume-enums.with(ref-numbering: ref-numbering)

  let tight-eqs = if tight-spacing == true {include-equations} else {false}

  show: spacing.init.with(default: tight-spacing, equations: tight-eqs)
  show <no-par>: it => { it + spacing.update-value(true) }
  show <end-par>: it => { 
    spacing.next-block-space.update(true)
    let (body: body, label: l, ..fields) = it.fields()
    math.equation(..fields, body)
    }

  doc
}
