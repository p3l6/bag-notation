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

Dont support double dots.
Tuplets must be within a cluster.

All barlines are `|` or `||` or `:|` or `|:`. Beginning and end of parts should use the double barline.

whitespace is required between final cluster and barline, or a cluster and a field paren.

Inline fields cannot be on a line by themselves, they must be mixed into a bar.

## not rules, but suggestions

Notes should be clustered by beat.

## allowed fields

all fields are listed as labels and require values, unless listed with parenthesis, such as `(value)`.

- header:
  - title: required
  - by: required
    - `trad` may also be listed by itself to specify the tune as trad, without a known composer
  - arr: an arranger
  - style: required
  - time: required, unless implied by a recognized valid [[tune style]]
  - note: set the base note length, ususally ommited for the default of eighth
  - tempo: set the tunes tempo. should be an integer in bpm
  - rev: set a revision date or version, placed in the footer (todo: clarify behavior when there are multiple pages and multiple tunes)
- inline fields:
  - (h): harmony line. only valid at the very beginning of a line
    - this has a shorthand, which is a single `&` at the beginning of the line
  - note: change the base note length
  - time: change the time signature
  - tempo: change the tempo
  - text: add an annotation to the following note
  
  
## language symbols

symbol | meaning
|---|---|
labcdefgh | the scale
qojkpzuym | the scale of literal gracenotes
tsnxvr | semantic embellishment markers
(label: value) | inline field
(value) | inline field without label
label: value | field, when inside header
& | shorthand field for harmony lines
`---` | header begin and end marker
`|:` | barline
% | comment marker
`_` | tie
`~` | slur
`-` | triplet/tuplet
`+` | doubles attached note length
`/` | cuts attached note length
`.` | dots attached note length

## Semantic embellishments

These consider the preceding and following note, to choose the correct embellishment 

t: a low tap
s: (soft) a light/softer low tap
n: (note) this is a stand-in for the following note
x: a high gracenote, usually g
v: a grip (looks like a grip, upside down, perhaps)
r: a throw

These can be combined, such as the following examples. n can be used, but is usually omitted when not ambiguous. 

xx: doubling. also could be written xnx => gracenote, theme note, gracenote. Usually the n is omitted.
vz: taorluath. A grip followed by an e grace.
xt: strike. (or xnt) gracenote, theme note, tap
tt: birl. the short one, as if from already on low a. 
    other birl variations include: 
        ntt: with a preceding low a
        xtt: with a high g gracenote at the beginning
        
a full list of the possible semantic embellishments and what they will yeild can be found on a different page. For now, see Sources/BagNotation/Models/Embellishment.swift 


# CLI

## format command

formatting aligns barlines in consecutive voice lines.
an empty line will "reset" the formatting, and the next group of lines will be aligned independently of what came before.

the formatter adds two blank lines between tunes, and a blank line after the tune header.

it removes trailing whitespace.
