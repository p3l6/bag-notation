#  Bag notation language

## Motivations

`abc notation` is very nice, but is too broad in application to be a joy for bagpipe writing.
Borrowing the general approach, there are a few things that can be refocused on when narrowing the scope to bagpipe:
* Avoid need for shift key as much as possible when typing a tune
* No infix dot-cut operators. Must annotate both notes instead for clarity
* Few language operator symbols, with no overlapping purposes based on context
* Highly "field" based; that is, many things that could have been expressed through syntax are acheived using fields.

## General Structure

This is the overview of the components parsed in a file, expressed in a tree of parent/child relationships. 
Items in brackets indicate that multiple children of that type may exist sequentially.
Items with question marks indicate they may be omitted.

```
┌─ File
└─┬─ [Tune]
  ├─┬─ Header
  │ └─┬─ [Field]
  │   ├─── Label
  │   └─── Value?
  └─┬─ Body
    └─┬─ [Line]
      └─┬─ [Bar]
        ├─┬─ [Note]
        │ ├─── Embellishment?
        │ ├─── Pitch
        │ └─── Duration?
        └─── Barline
```

Notes:
* Fields can exist inline, in the body as well. These are called inline fields and are contained in parentheses.
* Notes in bars are grouped into clusters, separated by spaces.
* Some fields also have 'shorthand' representations, consisting of a single symbol. These can appear even between notes in a cluster.
* The line must always end with a barline, but beginning a line with one is optional.

## All Language Symbols

This is a table of every character used in bag notation (with the exception of field values, which can contain any character except parentheses).
All characters in the file are expected be from the ascii character set.

| Characters       | Description 
| ----------       | ----------- 
| `labcdefgh`      | The scale, low to high   
| `qojkpzuym`      | The scale, as literal gracenotes
| `tsnxvr`         | Used for marking semantic embellishments
| `(label: value)` | An inline field
| `(label)`        | An inline field, that does not require a value 
| `label: value`   | A field, in the context of a tune header
| `&^',=01234`     | Shorthand field labels
| `---`            | Header begin and end marker
| `| |: || :|`     | Barline markers
| `#`              | Comment marker
| `_ ~ -`          | Tie, slur, and triplet/tuplet markers
| `+ / .`          | Doubles, cuts, or dots the duration of notes

## Semantic Embellishments

All embellishment patterns _could_ be made by sequences of the literal gracenotes. However, this is tedious and error-prone in practice. 

Instead, the semantic embellishment markers signify a meaning, or intent, of standard expression. The specific gracenote pattern is inferred, based on the preceeding and following notes.

* `x`: A high gracenote (usually a G, but depending on context, perhaps a high A, etc)
* `t`: A low tap (often a low G) 
* `s`: A light/softer low tap (disambiguates taps on notes like D, which may have a low G tap or C tap)
* `v`: A grip
* `r`: A throw
* `n`: The note, this is a stand-in for the following note (usually omitted, unless to disambiguate)

These six characters may be combined to indicate all common movements. Some common examples follow:

* `xx`: A doubling (Also could be written `xnx`, however the n is omitted for clarity)
* `vz`: A taorluath (A grip followed by an E grace)
* `xt`: A strike (alternatively, `xnt` A gracenote, theme note, then low tap) 
* `tt`: A birl (The short one, as if playing from low A) 
  * Other birl variations include: 
    * `ntt`: A birl with a preceding low A
    * `xtt`: A birl with a high G gracenote at the beginning

A full list of the possible semantic embellishments and what they will yeild is planned for a future documentation page.
For now, see `Sources/BagNotation/Models/Embellishment.swift`.

While this scheme works very well for all the most common piping movements, there exist some rare movements which don't have a good semantic binding and are outside its scope. For these, the literal gracenotes should be used instead. Such as: a crunluath with all low Gs (`qpqzquq`), cadences (`yzp`), edre on high G (`zquq`), etc.

## Fields

Fields are an essential concept in bag notation. Fields give context to the notes, change the time signature, describe harmonies and variations, and much more.

A field can appear in the file header, `label: value` on a single line: or inline in the tune body, `(label: value)`, with parentheses. A field without a colon is assumed to have no value. Some inline fields also have a shorthand symbol, which is used as that single character, without any parentheses.

All possible field labels are listed here. Most require values, unless stated.

### Fields only valid in the tune header

* `title`: The tune's title (Required for all tune headers)
* `by`: The tune's composer
* `trad`: Set the tune as "Traditional"
    * Either `trad` or `by` is required for all tune headers
    * This is an alternative to `by`, for traditional with unknown composers
    * This field has no value
* `arr`: An arranger
* `style`: A tune style or rhythm
    * Values include: "March", "4/4 March", "Jig", "Slow Air", etc
    * A full list of valid values is in `Sources/BagNotation/Models/Header.swift` at mark "Create from Strings"
    * Some of these styles have implied time signatures, in which case the `time` field may be omitted
* `rev`: A revision date or number, appears in the page footer
    * Only one revision is used per file. If more than one tune has revision field, the first will be used for all pages, and the rest ignored
* `newpage`: Forces this tune to be placed on a new page, instead of possibly sharing a page with the preceeding tune

### Fields valid for both the tune header and inline

* `time`: The tune's time signature
    * Required in the header, unless implied by the `style` field
    * When used inline, the current time signature changes at that point 
* `note`: Set the base note length
    * Values: "quarter", "eighth", "sixteenth", etc
    * Usually ommitted, as the default value is "eighth" and that works for most tunes 
    * All notes in the tune will start at this length, and then the modifications (doubled, cut, dotted) will be applied 
    * When used inline, the base length is changed for all following notes.
* tempo: Sets the tempo, as displayed on page output
    * Value should be an integer
    * When used inline, the new tempo will be notated at that point

### Fields only valid inline

* `h`: Indicates a harmony line
    * Only valid at the very beginning of a line
    * Shorthand: `&`
* `v`: Set's the current variation
    * Values: any string, usually like `2` or `2 of 4`
    * Without a value, signifies the end of the variation. Note that variations will end at the end at the end of a line, and so this is only needed when the variation is only a few notes in the middle of the line
    * Shorthands: `0 1 2 3 4`.  As the most common variation names, these numbers can be used alone. A zero will end the current variation. ie. `(v: 1) xa.b/ c (v: 2) xac e (v)` is the same as `1 xa.b/c 2 xac e 0`
* `text`: Adds an annotation to the following note
* `hold`: Adds a fermata on the following note
    * This field has no value
    * Shortand: `^`. Remember that shorthands can appear inside note clusters, before the note's embellishment (if any)
* `rest`: insert a rest
    * Values: a duration; the same as would follow a note pitch. eg `+` or `//` or `+.`
    * The value may be ommitted, in which case the base note lengh is used
    * The value may also be `bar`. This would create a whole bar rest, ie `| (rest: bar) |`. _Note:_ do not put other notes in the bar, this is undefined. 
* `spacer`: Similar to `rest`, but doesn't print the rest symbol
    * Takes the same values as `rest`
    * Useful for filling out underful harmony bars, to line up the barlines. (Note: this is really a technical limitation in the underlying abc renderer, hopefully to be fixed someday)
* `sharp`: Marks the next note as a sharp accidental
    * This field has no value
    * Shorthand: `'` (apostrophe) Remember that shorthands can appear inside note clusters, before the note's embellishment (if any)
* `flat`: Marks the next note as a flat accidental
    * This field has no value
    * Shorthand: `,` (comma) Remember that shorthands can appear inside note clusters, before the note's embellishment (if any)
* `nat`: Marks the next note as a natural accidental 
    * This field has no value
    * Shorthand: `=` Remember that shorthands can appear inside note clusters, before the note's embellishment (if any)
* `chord`: Adds a additional pitch to the next note
    * For example, `(chord: c) xa++` creates a chord with A and C, where A is the primary pitch. The primary pitch used for determining semantic gracenotes related to the chord
      
## Tune Header

The tune header preceeds every tune. It is delimited by three dashes on a line at the beginning and end, similar to yaml frontmatter. The tune header is usually followed by a blank line, with two blank lines between a tune and the following tune's header.

Comments are not allowed in the tune header, nor are blank lines. 

```
---
title: Some tune
style: 4/4 March
trad
---

...tune body...

```

## Lines and Bars

Each line starts with an optional field, an optional leading barline, then followed by as many bars as needed.
Every line should have at least one bar (unless it's completely blank), that means, inline fields cannot be on a line by themselves (even if followed by a barline, as that would be the leading barline).

Each bar consists of a series of note clusters or fields, and ends with a barline. A bar must contain at least one of these items.
Whitespace is required between the final cluster in a bar and the barline; and between any cluster and a field parentheses.

Valid barlines are `|` or `||` or `:|` or `|:`. The beginning and end of parts should use the double barline.

## Clusters and Notes

Clusters are notes joined without spaces. Clusters are separated by spaces. Notes in a cluster (eighth notes and shorter) will be joined together, so ideally there is one cluster per beat, but that is a stylistic choice.

Each note consists of:
* (optional) A shorthand field symbol, for example an accidental or a fermata
* (optional) An embellishment 
* (required) A pitch, one of the characters `labcdefgh`
* (optional) A duration modifier, some combination of `+ / .`
    * `+` doubles the length of the note, `/` cuts or halves the length, `.` adds half the value or "dots" it
    * Assuming the base length is an eighth (default), then `a+` is a quarter note, `a++` a half note, `a+.` a dotted quarter, `a//` a sixteenth, etc
    * Dots should be at the end of the list, and double dotting is not supported
* (optional) A connector, one of `_ ~ -`
    * `_` creates a tie to the following note, which should have the same pitch. Multiple ties may be used in a row, like `b+_ b+_ b/`
    * `~` creates slurs
    * `-` creates tuplets. Usually used in pairs, as `a-b-c`, to create a triplet. All notes in the tuplet must be in the same cluster
