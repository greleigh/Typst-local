// examples
#import "../lib.typ": init

#show: init

= Resumable enums

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


== Nested enums

#set enum(full: true, numbering: "1a")

+ One
  + sub
  + sub-sub
  Pause, and resume <resume-enum>
  + sub-sub-sub

Now resume the parent <resume-enum>
+ Two


= Spacing

- By default, lists, etc. are separated
- below by paragraph spacing.

This paragraph is not tight against the list above. Next is a equation
$
  a=b
$ 
followed by text. #lorem(20)

#show: init.with(post-spacing: false,include-equations:true)

- A list
- Which is tight against the next paragraph
Next paragraph is tight against list. Next is a equation
$
  a=b
$ 
followed by text. #lorem(20)
