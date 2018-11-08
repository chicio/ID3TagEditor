// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "DemoUbuntu",
    dependencies: [
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "2.2.0"),
    ],
    targets: [
        .target(
            name: "DemoUbuntu",
            dependencies: ["ID3TagEditor"]),
        .testTarget(
            name: "DemoUbuntuTests",
            dependencies: ["DemoUbuntu"]),
    ]
)
