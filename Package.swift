// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "FrameBuilder",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FrameBuilder",
            targets: ["FrameBuilder"]),
    ],
    targets: [
        .target(
            name: "FrameBuilder",
            path: "Sources"),
        .testTarget(
            name: "FrameBuilderTests",
            dependencies: ["FrameBuilder"],
            path: "Tests"),
    ]
)
