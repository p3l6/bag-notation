; formatting.scm


(voice
  .
  (field)? @leadingField
  .
  (barline)? @leadingBarline
  .
  (bar
    .
    (cluster . (note) @firstNote)
    (barline) @normalBarline
  )
  .
  (bar
    (barline) @normalBarline
  )+
)
