// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ID3TagEditor",
    platforms: [
           .macOS(.v10_13),
           .iOS(.v12),
           .tvOS(.v12),
           .watchOS(.v5),
           .linux
    ],
    products: [
        .library(
            name: "ID3TagEditor",
            targets: ["ID3TagEditor"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ID3TagEditor",
            dependencies: [],
            path: "./Source",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "ID3TagEditorTests",
            dependencies: ["ID3TagEditor"],
            path: "./Tests",
            exclude: ["Utils/PathLoaderXcodeProj.swift", "Info.plist"],
            resources: [.process("Examples")]
        )
    ],
    swiftLanguageVersions: [.v5]
)
