# Bag Notation

The compiler and language reference for `.bag` music notation files

## Running

* `bag abc something.bag` -> prints compiled abc source as output
* `bag abc -o something.abc something.bag` -> writes output to `something.abc`
* `bag format something.bag` -> prints formatted output
* `bag format --dry-run something.bag` -> prints nothing, but exits with status 0 only if no changes would be made
* `bag format -i something.bag` -> formats input by overwriting

## Writing

Some editors that support bag notation:

* Vscode, via the extension in this repository.
  - highlights syntax
  - will autocorrect ` i ` to ` | `, which can make typing barlines quicker.
  - isn't currently published: see the [extension readme](vscode-extension/README.md) for local build instructions.
* Chanter tape. a future dedicated macOS app.

## Documentation

[Documentation](/Documentation.docc/Documentation.md)

[Sample Tunes](/Sample%20Tunes/)

[Quick Reference](/Documentation.docc/Resources/Quick%20Reference.pdf)

## Development

Swift 6 is required.

As a pure swift library, xcode is not required, only the swift compiler.
It will build on the linux distribution of swift as well.

### Tree sitter

The c source produced by the tree sitter grammar is commited to the repository.
To update the output when changing the grammar:

```
cd tree-sitter-bag-notation
npm run generate && npm run test
```
