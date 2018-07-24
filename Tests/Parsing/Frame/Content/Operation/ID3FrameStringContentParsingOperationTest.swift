//
//  ID3StringContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3StringContentParsingOperationTest: XCTestCase {
    func testFrameContentParsedV2() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version2, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
                stringEncodingDetector: ID3FrameStringEncodingDetector(
                    id3FrameConfiguration: ID3FrameConfiguration(),
                    id3StringEncodingConverter: ID3StringEncodingConverter()
                ),
                paddingRemover: PaddingRemoverUsingTrimming(),
                id3FrameConfiguration: ID3FrameConfiguration()
        ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, ":: value ::")
            expectation.fulfill()
         }

        id3StringContentParsingOperation.parse(frame: frameV2(), id3Tag: id3Tag)
    }

    func testFrameContentParsedV3() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version3, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
                stringEncodingDetector: ID3FrameStringEncodingDetector(
                    id3FrameConfiguration: ID3FrameConfiguration(),
                    id3StringEncodingConverter: ID3StringEncodingConverter()
                ),
                paddingRemover: PaddingRemoverUsingTrimming(),
                id3FrameConfiguration: ID3FrameConfiguration()
        ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, ":: value ::")
            expectation.fulfill()
        }

        id3StringContentParsingOperation.parse(frame: frameV3(), id3Tag: id3Tag)
    }
    
    func testFrameContentParsedV2utf16() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version2, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, ":: π value ::")
            expectation.fulfill()
        }
        
        id3StringContentParsingOperation.parse(frame: frameV2utf16(), id3Tag: id3Tag)
    }
    
    func testFrameContentParsedV3utf16() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version3, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, ":: π value ::")
            expectation.fulfill()
        }

        id3StringContentParsingOperation.parse(frame: frameV3utf16(), id3Tag: id3Tag)
    }
    
    func testFrameContentParsedV4utf8() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version4, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
            stringEncodingDetector: ID3FrameStringEncodingDetector(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3StringEncodingConverter: ID3StringEncodingConverter()
            ),
            paddingRemover: PaddingRemoverUsingTrimming(),
            id3FrameConfiguration: ID3FrameConfiguration()
        ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, ":: π value ::")
            expectation.fulfill()
        }
        
        id3StringContentParsingOperation.parse(frame: frameV4utf8(), id3Tag: id3Tag)
    }

    private func frameV2() -> Data {
        return Data(bytes:
            [UInt8]("TAL".utf8) + [0x00, 0x00, 0x00] +
                [0x00] + [UInt8](":: value ::".utf8)
        )
    }
    
    private func frameV2utf16() -> Data {
        return Data(bytes:
            [UInt8]("TAL".utf8) + [0x00, 0x00, 0x00] +
                [0x01, 0xFF, 0xFE] + ":: π value ::".utf16ToBytes
        )
    }

    private func frameV3() -> Data {
        return Data(bytes: [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
            [0x00] + [UInt8](":: value ::".utf8)
        )
    }
    
    private func frameV3utf16() -> Data {
        return Data(bytes:
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x01, 0xFF, 0xFE] + ":: π value ::".utf16ToBytes
        )
    }
    
    private func frameV4utf8() -> Data {
        return Data(bytes:
            [UInt8]("TALB".utf8) + [0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] +
                [0x03] + [UInt8](":: π value ::".utf8)
        )
    }
}
