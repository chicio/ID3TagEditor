// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "ID3TagEditor",
    products: [
        .library(
            name: "ID3TagEditor",
            targets: ["ID3TagEditor"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ID3TagEditor",
            dependencies: [],
            path: "./Source"
        ),
        .testTarget(
            name: "ID3TagEditorTests",
            dependencies: ["ID3TagEditor"],
            path: "./Tests",
            exclude: [
                "Parsing/Frame/Content/Size/ID3FrameContentSizeParserTest.swift",
                "Parsing/Frame/Content/Operation/ID3FrameStringContentParsingOperationTest.swift",
                "Parsing/Frame/Size/ID3FrameSizeParserTest.swift",
                "Parsing/Tag/Size/ID3TagSizeParserTest.swift",
                "Parsing/Tag/Version/ID3TagVersionParserTest.swift",
                "Acceptance/ID3TagEditorTestAcceptanceTest.swift",
                "Mp3/Mp3FileReaderTest.swift"
            ]
        ),
    ],
    swiftLanguageVersions: [.v4_2]
)
