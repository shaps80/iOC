// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOC",
    products: [
        .library(
            name: "iOC",
            targets: ["iOC"]),
    ],
    targets: [
        .target(
            name: "iOC",
            dependencies: []),
        .testTarget(
            name: "iOCTests",
            dependencies: ["iOC"]),
    ]
)
