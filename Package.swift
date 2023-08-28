// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bagfile",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Bagfile",
            targets: ["Bagfile"]),
        .executable(name: "Example", targets: ["Example"]),
        .library(name: "TreeSitterBagfile", targets: ["TreeSitterBagfile"]),

    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.7.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Bagfile",
            dependencies: []),
        .executableTarget(
            name: "Example",
            dependencies: ["SwiftTreeSitter",
                           "TreeSitterBagfile",]),
        .testTarget(
            name: "BagfileTests",
            dependencies: ["Bagfile"]),
        .target(name: "TreeSitterBagfile",
                path: "tree-sitter-bagfile",
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
                    "src/node-types.json",
                ],
                sources: [
                    "src/parser.c",
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ]
)
