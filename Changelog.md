# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), slightly adapted,
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Types of changes: New, Improved, Fixed, Removed.

## [Unreleased]



## [1.1.0] - 16 Oct 2026

- New: Native pdf rendering using CoreGraphics, replaces abcm2ps and ghostscript dependencies. (macos only)
- New: Added `--legacy` flag to the `pdf` command, to fall back to abmc2ps->ps2pdf rendering pipeline 
- Deprecated: Spacers are not considered in new renderer, and are deprecated. Instead, for full bar spacers, bars may be left blank `|      |`
- Deprecated: Dense mode is not considered in the new renderer, and is deprecated.

## [1.0.1] - 17 Apr 2026

- Fixed: Issue where some invalid embellishment errors would be missing the file location
- Fixed: Zed issue with path quoting
- Fixed: Single-note variations at the end of a bar would close after the barline
- Improved: Added embellishment case for a grip from D to E
- Improved: Auto-detect half doublings when using `xx` after high-A

## [1.0.0] - 27 Aug 2025

- New: Added zed extension
- New: Abc command has new flag `--printed` to direct output to the terminal instead of a file
- New: Added `dense` field label for tune headers
- Improved: CLI output flag (`-o`) is now optional for abc and pdf commands
- Improved: Uses strict concurrency for swift 6 language mode

### Breaking changes

Ommitting the `-o` command line option will no longer print the output. To print the output, use `--printed`.

## [0.4.1] - 14 Feb 2025

- Fixed: Ventura homebrew builder compatibility

## [0.4.0] - 14 Feb 2025

- New: Option to omit harmoies when rendering

## [0.3.0] - 9 Feb 2025

- New: Command to render tune as a pdf

## [0.2.0] - 6 Feb 2025

- New: Tree sitter highlight queries
- New: CLI flag to format in landscape mode
- Fixed: An issue parsing 3/2 and 6/4 time signatures
- New: Added 'i' to barline parsing, as an alternative to the pipe caracter
- Fixed: Remove API that requires swift version 6

## [0.1.0] - 11 Nov 2024

- New: Bag notation language specification documentation
- New: Tree sitter grammar
- New: Bag notation parsing library, with unit tests
- New: CLI program `bag`, with action to convert bag notation to abc notation
