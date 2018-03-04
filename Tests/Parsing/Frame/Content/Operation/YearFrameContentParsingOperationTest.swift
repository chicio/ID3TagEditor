//
//  YearFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class YearFrameContentParsingOperationTest: XCTestCase {
    private let value = "::value::"

    func testSetTagYear() {
        let tag = ID3Tag(version: .version3, size: 10)
        let yearFrameContentParsingOperation = YearFrameContentParsingOperation(
                stringContentParsingOperation: MockFrameContentParsingOperation(returnValue: value)
        )

        yearFrameContentParsingOperation.parse(frame: Data(), id3Tag: tag)

        XCTAssertEqual(tag.year, value)
    }
}
