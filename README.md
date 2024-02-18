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

## allowed fields

all fields are listed as labels and require values, unless listed with parenthesis, such as `(value)`.

- header:
  - title: required
  - composer: required, unless included in title with 'by'
  - style: required
  - time: required, unless implied by a recognized valid [[tune style]]
  - note: set the base note length, ususally ommited for the default of 1/8
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
`|[]:` | barline
% | comment marker
`-` | tie, or slur
`+` | doubles attached note length
`/` | cuts attached note length
`.` | dots attached note length

