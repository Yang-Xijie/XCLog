// swift-tools-version:5.0

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
    ]
)
