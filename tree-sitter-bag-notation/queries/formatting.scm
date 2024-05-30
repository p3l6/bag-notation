; formatting.scm


(voice
  .
  (field)? @leadingField
  .
  (barline)? @leadingBarline
  .
  (bar
    (barline) @normalBarline
  )+
)
