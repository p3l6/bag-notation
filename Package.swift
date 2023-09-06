// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bag Notation",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BagNotation",
            targets: ["BagNotation"]),
        .executable(name: "Example", targets: ["Example"]),
        .library(name: "TreeSitterBagNotation", targets: ["TreeSitterBagNotation"])

    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.7.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BagNotation",
            dependencies: []),
        .executableTarget(
            name: "Example",
            dependencies: ["SwiftTreeSitter",
                           "TreeSitterBagNotation"]),
        .testTarget(
            name: "BagNotationTests",
            dependencies: ["BagNotation"]),
        .target(name: "TreeSitterBagNotation",
                path: "tree-sitter-bag-notation",
                exclude: [
                    "binding.gyp",
                    "bindings",
                    "Cargo.toml",
                    "corpus",
                    "grammar.js",
                    "package.json",
                    "package-lock.json",
                    "node_modules",
                    "src/grammar.json",
                    "src/node-types.json"
                ],
                sources: [
                    "src/parser.c"
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ])
