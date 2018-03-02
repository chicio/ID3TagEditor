//
//  TitleFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class TitleFrameContentParsingOperationTest: XCTestCase {
    private let value = "::value::"

    func testSetTagTitle() {
        let tag = ID3Tag(version: .version3, size: 10)
        let titleFrameContentParsingOperation = TitleFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: value)
        )

        titleFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssertEqual(tag.title, value)
    }
}
