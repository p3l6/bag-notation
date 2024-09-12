# ``Bag Notation``

Project documentation and language reference for the bag notation music file format.

## Overview

Bag notation is a text-based music notation, designed for bagpipes and optimized for human write-ability.
The language itself was inspired by the concept of ABC notation, but streamlined for common bagpipe idioms.

This package describes the langague, and contains a swift-based compiler that will convert a bag notation file to an abc notation file.
Existing toolchains can then be used to convert the abc to a pdf. Converting straight to pdf is a future goal of this library.

## Language reference

Primary notation format: ``Language``.

[Quick Reference](Documentation.docc/Resources/Quick Reference.pdf)
A quick reference with examples (not exhaustive) of common notation. The source for this can be found in `repo/Sample Tunes/Quick Reference.bag`. 

## Topics

### Tree sitter

This compiler uses tree sitter to generate an AST. 
The ts-grammar can be found in `repo/tree-sitter-bag-notation/grammar.js` 

### Parser

- ``BagReader``

### Abc output

- ``AbcWriter``
