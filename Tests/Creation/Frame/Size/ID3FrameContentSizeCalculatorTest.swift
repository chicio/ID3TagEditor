//
//  ID3FrameContentSizeCalculatorTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3FrameContentSizeCalculatorTest: XCTestCase {
    private let id3FrameContentSizeCalculator = ID3FrameContentSizeCalculator(
            uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
            synchsafeEncoder: SynchsafeIntegerEncoder()
    )

    func testContentCalculateSizeForVersion2() {
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version2)

        XCTAssertEqual(size, [0x2])
    }

    func testContentCalculateSizeForVersion3() {
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version3)

        XCTAssertEqual(size, [0x3, 0x2])
    }
    
    func testContentCalculateSizeForVersion4() {
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version4)

        XCTAssertEqual(size, [0x3, 0x2])
    }
}
