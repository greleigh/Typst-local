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
#let init(..options, post-spacing: none, ref-numbering: "1.1", doc) = {
  show: enable-referable-enums
  show: enable-resume-enums.with(ref-numbering: ref-numbering)

  show: spacing.init.with(default: post-spacing)
  show <no-par>: it => { it + spacing.update-value(true) }
  show <end-par>: it => { it + spacing.update-value(false) }

  doc
}
