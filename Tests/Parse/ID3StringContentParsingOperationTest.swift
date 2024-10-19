//
//  ID3StringContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3StringContentParsingOperationTest {
    @Test func testTooSmallDataValue() {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let value = stringContentParser.parse(frame: Data(capacity: 1), version: .version3)
        #expect(value == nil)
    }

    @Test func testFrameContentParsedV2() async {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: value ::"))
        }

        await confirmation("content without padding") { fulfill in
            id3StringContentParsingOperation.parse(
                frame: frameV2(),
                version: .version2,
                completed: {(frameName, frame) in
                    #expect(frameName == .title)
                    #expect((frame as? ID3FrameWithStringContent)?.content == ":: value ::")
                    fulfill()
            })
        }
    }

    @Test func testFrameContentParsedV3() async {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: value ::"))
        }

        await confirmation("content without padding") { fulfill in
            id3StringContentParsingOperation.parse(
                frame: frameV3(),
                version: .version2,
                completed: {(frameName, frame) in
                    #expect(frameName == .title)
                    #expect((frame as? ID3FrameWithStringContent)?.content == ":: value ::")
                    fulfill()
            })
        }
    }

    @Test func testFrameContentParsedV2utf16() async {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        await confirmation("content without padding") { fulfill in
            id3StringContentParsingOperation.parse(
                frame: frameV2utf16(), version: .version2,
                completed: {(frameName, frame) in
                    #expect(frameName == .title)
                    #expect((frame as? ID3FrameWithStringContent)?.content == ":: π value ::")
                    fulfill()
                })
        }
    }

    @Test func testFrameContentParsedV3utf16() async {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        await confirmation("content without padding") { fulfill in
            id3StringContentParsingOperation.parse(
                frame: frameV3utf16(), version: .version3,
                completed: {(frameName, frame) in
                    #expect(frameName == .title)
                    #expect((frame as? ID3FrameWithStringContent)?.content == ":: π value ::")
                    fulfill()
                })
        }
    }

    @Test func testFrameContentParsedV4utf8() async {
        let stringContentParser = ID3FrameStringContentParser(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringContentParser: stringContentParser
        ) { (_: String) in
            return (.title, ID3FrameWithStringContent(content: ":: π value ::"))
        }

        await confirmation("content without padding") { fulfill in
            id3StringContentParsingOperation.parse(
                frame: frameV4utf8(),
                version: .version4,
                completed: {(frameName, frame) in
                    #expect(frameName == .title)
                    #expect((frame as? ID3FrameWithStringContent)?.content == ":: π value ::")
                    fulfill()
                })
        }
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
}
