// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Bag Notation",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "BagNotation", targets: ["BagNotation"]),
        .library(name: "TreeSitterBagNotation", targets: ["TreeSitterBagNotation"])
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", "0.9.0" ..< "0.10.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .executableTarget(
            name: "bag",
            dependencies: [
                "BagNotation",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources/Bag"),
        .target(
            name: "BagNotation",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterBagNotation"
            ]),
        .testTarget(name: "BagNotationTests", dependencies: ["BagNotation"]),
        .target(
            name: "TreeSitterBagNotation",
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
