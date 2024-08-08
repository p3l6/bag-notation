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
  - rev: set a revision date or version, placed in the footer
    - note: only one revision is used globally per file. If more than one tune has revision field, only the first will be used, on all pages. 
  - newpage: force placing this tune on a new page
- inline fields:
  - (h): harmony line. only valid at the very beginning of a line
    - this has a shorthand, which is a single `&` at the beginning of the line
  - (v: 2): variation. any string can be field value. such as "2" or "2 of 4". 
    - a (v) by itself will signify the end of the variation, this is not needed if it ends at the end of a line.
    - there are shorthands for the most common variation labels. `1 2 3 4` can be used by themselfs and `0` will end the variation.  
  - note: change the base note length
  - time: change the time signature
  - tempo: change the tempo
  - text: add an annotation to the following note
  - hold: insert a fermata on next note
    - this has a shortand, `^`, which can also appear inside clusters, before the embellishment
  - rest: insert a rest
    - value can be a duration, same as would follow a note pitch, eg `+` or `//` or `+.`
    - value can also be `bar`, to rest the whole bar. (Don't put other notes in the bar though)
  - spacer: like a rest, but doesn't print the rest symbol. Useful for filling out underful harmony bars.
  - sharp: marks the next note as sharp
    - the shorthand is apostrophe `'` and can appear inside clusters before embellishments
  - flat: marks the next note as flat
    - the shorthand is comma `,` and can appear inside clusters before embellishments
  - nat: makrs the next note as natural
    - the shorthand is equals `=` and can appear inside clusters before embellishments
  - chord: adds a pitch to the next note, in addition to the primary pitch already there
    - for example, `(chord: c) xa++` creates a chord with A and C, where A is the primary note value used for determining gracenotes before and after the group
      
  
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
`^` | shorthand field to add fermata
`',=` | shorthand accidentals
`01234` | shorthand variations

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
TODO: document the following literals as well: crunluath a mach, crunluath with low g's, cadences

# CLI

## format command

formatting aligns barlines in consecutive voice lines.
an empty line will "reset" the formatting, and the next group of lines will be aligned independently of what came before.

the formatter adds two blank lines between tunes, and a blank line after the tune header.

it removes trailing whitespace.
