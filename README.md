# Bag Notation

The compiler and language reference for `.bag` music notation files

## Installing

Install via homebrew:

```
brew install p3l6/tap/bag-notation
```
This will also install dependencies required for pdf generation: 
- `abcm2ps`, of a fork with a [few custom changes](https://github.com/p3l6/abcm2ps)
- `ghostscript`, for the ps2pdf tool

## Running

* `bag pdf -o something.pdf something.bag` -> writes output to `something.pdf`
* `bag abc something.bag` -> prints compiled abc source as output
* `bag abc -o something.abc something.bag` -> writes output to `something.abc`
* `bag format something.bag` -> prints formatted output
* `bag format --dry-run something.bag` -> prints nothing, but exits with status 0 only if no changes would be made
* `bag format -i something.bag` -> formats input by overwriting

## Writing

Some editors that support bag notation:

* Coming soon: Zed extension
* Vscode, via the extension in this repository.
  - ::Deprecated::
  - highlights approximate syntax
  - isn't published: see the [extension readme](vscode-extension/README.md) for local build instructions.

## Documentation

[Documentation](/Documentation.docc/Documentation.md)

[Sample Tunes](/Sample%20Tunes/)

[Quick Reference](/Documentation.docc/Resources/Quick%20Reference.pdf)

## Development

As a pure swift library, xcode is not required, only the swift compiler.  
It will build on the linux distribution of swift as well.
Requires swift version 6.

### Tree sitter

The c source produced by the tree sitter grammar is commited to the repository.
To update the output when changing the grammar:

```
cd tree-sitter-bag-notation
npm run generate && npm run test
```
