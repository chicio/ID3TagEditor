// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Demo Ubuntu",
    dependencies: [
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "Demo Ubuntu",
            dependencies: ["ID3TagEditor"]
        )
    ]
)
