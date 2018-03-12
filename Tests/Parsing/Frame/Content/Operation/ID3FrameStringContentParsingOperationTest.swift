//
//  ID3StringContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3StringContentParsingOperationTest: XCTestCase {
    private let value = "::value::"

    func testFrameContentParsedV2() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version2, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
                paddingRemover: MockPaddingRemover(returnValue: value),
                id3FrameConfiguration: ID3FrameConfiguration()
        ) { [unowned self](id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, self.value)
            expectation.fulfill()
         }

        id3StringContentParsingOperation.parse(frame: frameV2(), id3Tag: id3Tag)
    }

    func testFrameContentParsedV3() {
        let expectation = XCTestExpectation(description: "content without padding")
        let id3Tag = ID3Tag(version: .version3, size: 0)
        let id3StringContentParsingOperation = ID3FrameStringContentParsingOperation(
                paddingRemover: MockPaddingRemover(returnValue: value),
                id3FrameConfiguration: ID3FrameConfiguration()
        ) { [unowned self](id3Tag: ID3Tag, frameContentWithoutPadding: String) in
            XCTAssertEqual(frameContentWithoutPadding, self.value)
            expectation.fulfill()
        }

        id3StringContentParsingOperation.parse(frame: frameV3(), id3Tag: id3Tag)
    }

    private func frameV2() -> Data {
        return Data(bytes: [0x41, 0x4C, 0x42, 0x00, 0x00, 0x00] + [0x11, 0x11])
    }

    private func frameV3() -> Data {
        return Data(bytes: [0x54, 0x41, 0x4C, 0x42, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00] + [0x11, 0x11])
    }
}
