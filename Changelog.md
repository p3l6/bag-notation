# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), slightly adapted,
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Types of changes: New, Improved, Fixed, Removed.

## [Unreleased]

- New: Added zed extension
- New: Abc command has new flag `--printed` to direct output to the terminal instead of a file
- Improved: CLI output flag (`-o`) is now optional for abc and pdf commands
- Improved: Uses strict concurrency for swift 6 language mode

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
