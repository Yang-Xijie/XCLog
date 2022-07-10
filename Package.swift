// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "XCLog",
    products: [
        .library(
            name: "XCLog",
            targets: ["XCLog"]
        ),
    ],
    targets: [
        .target(
            name: "XCLog",
            dependencies: []
        ),
        .testTarget(
            name: "XCLogTests",
            dependencies: ["XCLog"]),
    ]
)
