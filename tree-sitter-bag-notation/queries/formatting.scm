; formatting.scm


(voice
  .
  (inline_field)? @leadingField
  .
  (barline)? @leadingBarline
  .
  (bar
    (barline) @normalBarline
  )+
)
