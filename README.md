# Bag Notation

Compiler for .bag music files 

## Development

Updating tree sitter grammar: 
```
cd tree-sitter-bag-notation
npm run generate && npm run test
```

# Language

## rules

Comments are not allowed in tune header.
Header may not contain blank lines. 

Notes should be clustered by beat.
Dont support double dots.

All barlines are `|` or `||` or `:|` or `|:`. Beginning and end of parts should use the double barline.

## allowed fields

all fields are listed as labels and require values, unless listed with parenthesis, such as `(value)`.

- header:
  - title: required
  - composer: required
    - composer may also be included in the title field, with 'by'
    - `trad` may also be listed by itself to specify the tune as trad, without a known composer
  - style: required
  - time: required, unless implied by a recognized valid [[tune style]]
  - note: set the base note length, ususally ommited for the default of eighth
- inline fields:
  - (h): harmony line. only valid at the very beginning of a line
  - note: change the base note length
  - time: change the time signature
  
  
## language symbols

symbol | meaning
|---|---|
qrabcdefga | the scale
phluxtvwzkn | embellishment markers
(label: value) | inline field
(value) | inline field without label
label: value | field, when inside header
`---` | header begin and end marker
`|:` | barline
% | comment marker
`_` | tie, or slur
`+` | doubles attached note length
`/` | cuts attached note length
`.` | dots attached note length

