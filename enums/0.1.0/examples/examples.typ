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
