// examples
#import "../lib.typ": init, referable-enum

#show: init

= Enumable features

== Resumable enums

Starting an enum list
+ One
+ Two

After a break, resume: <resume-enum>
+ Three
+ Four

Explicit start:
10. Ten
+ Eleven

And resume <resume-enum>
+ Twelve
+ Thirteen


=== Nested enums

#set enum(full: true, numbering: "1a.")

+ One
  + sub
  + sub-sub
  Pause, and resume <resume-enum>
  + sub-sub-sub

Now resume the parent <resume-enum>
+ Two


== Spacing

- By default, lists, etc. are separated
- below by paragraph spacing.

This paragraph is not tight against the list above. Next is a equation
$
  a=b
$ 
followed by text. #lorem(20)

#show: init.with(tight-spacing: true,include-equations:true)

- A list
- Which is tight against the next paragraph
Next paragraph is tight against list. Next is a equation
$
  a=b
$ 
followed by text. #lorem(20)

If an equation ends a paragraph, it can be overriden by attaching a label `<end-par>`:
$
  a=b
$ <end-par>
#lorem(20)

== Referable enums

// #show: init

#referable-enum(refnumbering: "i")[
+ One <item1>
+ Two <item2>]

Items can be referenced along with other elements: Items @item1 and @item2

The reference style can be altered but is fixed with each
#show: referable-enum.with(refnumbering: "(a)", numbering: "a.")
+ One <item3>
+ One <item4>

Now the references have brackets @item3
