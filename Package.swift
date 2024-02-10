// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Bag Notation",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "BagNotation", targets: ["BagNotation"]),
        .library(name: "TreeSitterBagNotation", targets: ["TreeSitterBagNotation"])
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.7.2"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
    ],
    targets: [
        .executableTarget(name: "Bag", dependencies: [
            "BagNotation",
            .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]),
        .target(name: "BagNotation", dependencies: [
            "SwiftTreeSitter",
            "TreeSitterBagNotation"
        ]),
        .testTarget(name: "BagNotationTests", dependencies: ["BagNotation"]),
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
                sources: ["src/parser.c"],
                resources: [.copy("queries")],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ])
