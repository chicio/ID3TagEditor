//
//  ID3FrameConfigurationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameConfigurationTest: XCTestCase {
    func testInvalidIdentifierName() {
        XCTAssertEqual(ID3FrameConfiguration().frameTypeFor(identifier: "::not-valid::", version: .version2), .Invalid)
    }
}
