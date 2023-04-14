//
//  ID3StringContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3StringContentParsingOperationTest: XCTestCase {
    private let stringContentParser = ID3FrameStringContentParser(
        stringEncodingDetector: ID3FrameStringEncodingDetector(
            id3FrameConfiguration: ID3FrameConfiguration(),
            id3StringEncodingConverter: ID3StringEncodingConverter()
        ),
        paddingRemover: PaddingRemoverUsingTrimming(),
        id3FrameConfiguration: ID3FrameConfiguration()
    )
    
    func testTooSmallDataValue() {
        let value = stringContentParser.parse(frame: Data(capacity: 1), version: .version3)
        XCTAssertNil(value)
    }

    func testFrameContentParsedV2() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: value ::"))
        }

        id3StringContentParsingOperation.parse(frame: frameV2(), version: .version2, completed: {(frameName, frame) in
            XCTAssertEqual(frameName, .title)
            XCTAssertEqual((frame as? ID3FrameWithStringContent)?.content, ":: value ::")
            expectation.fulfill()
        })
    }

    func testFrameContentParsedV3() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: value ::"))
        }

        id3StringContentParsingOperation.parse(frame: frameV3(), version: .version2, completed: {(frameName, frame) in
            XCTAssertEqual(frameName, .title)
            XCTAssertEqual((frame as? ID3FrameWithStringContent)?.content, ":: value ::")
            expectation.fulfill()
        })
    }

    func testFrameContentParsedV2utf16() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        id3StringContentParsingOperation.parse(
            frame: frameV2utf16(), version: .version2,
            completed: {(frameName, frame) in
                XCTAssertEqual(frameName, .title)
                XCTAssertEqual((frame as? ID3FrameWithStringContent)?.content, ":: π value ::")
                expectation.fulfill()
            })
    }

    func testFrameContentParsedV3utf16() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        id3StringContentParsingOperation.parse(
            frame: frameV3utf16(), version: .version3,
            completed: {(frameName, frame) in
                XCTAssertEqual(frameName, .title)
                XCTAssertEqual((frame as? ID3FrameWithStringContent)?.content, ":: π value ::")
                expectation.fulfill()
        })
    }

    func testFrameContentParsedV4utf8() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        id3StringContentParsingOperation.parse(
            frame: frameV4utf8(),
            version: .version4,
            completed: {(frameName, frame) in
                XCTAssertEqual(frameName, .title)
                XCTAssertEqual((frame as? ID3FrameWithStringContent)?.content, ":: π value ::")
                expectation.fulfill()
        })
    }

    private func frameV2() -> Data {
        return Data(
            [UInt8]("TAL".utf8) + [0x00, 0x00, 0x00] +
                [0x00] + [UInt8](":: value ::".utf8)
        )
    }

    private func frameV2utf16() -> Data {
        return Data(
            [UInt8]("TAL".utf8) + [0x00, 0x00, 0x00] +
                [0x01, 0xFF, 0xFE] + ":: π value ::".utf16ToBytes
        )
    }

    private func frameV3() -> Data {
        return Data([UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                        [0x00] + [UInt8](":: value ::".utf8)
        )
    }

    private func frameV3utf16() -> Data {
        return Data(
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x01, 0xFF, 0xFE] + ":: π value ::".utf16ToBytes
        )
    }

    private func frameV4utf8() -> Data {
        return Data(
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8](":: π value ::".utf8)
        )
    }

    static let allTests = [
        ("testFrameContentParsedV2", testFrameContentParsedV2),
        ("testFrameContentParsedV3", testFrameContentParsedV3),
        ("testFrameContentParsedV2utf16", testFrameContentParsedV2utf16),
        ("testFrameContentParsedV3utf16", testFrameContentParsedV3utf16),
        ("testFrameContentParsedV4utf8", testFrameContentParsedV4utf8)
    ]
}
