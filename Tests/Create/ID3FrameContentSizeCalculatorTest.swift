//
//  ID3FrameContentSizeCalculatorTest.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FrameContentSizeCalculatorTest {

    @Test func testContentCalculateSizeForVersion2() {
        let id3FrameContentSizeCalculator = ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
        )
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version2)

        #expect(size == [0x2])
    }

    @Test func testContentCalculateSizeForVersion3() {
        let id3FrameContentSizeCalculator = ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
        )
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version3)

        #expect(size == [0x3, 0x2])
    }

    @Test func testContentCalculateSizeForVersion4() {
        let id3FrameContentSizeCalculator = ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: MockUInt32ToByteArrayAdapter(),
                synchsafeEncoder: SynchsafeIntegerEncoder()
        )
        let size = id3FrameContentSizeCalculator.calculateSizeOf(content: [0x1, 0x1], version: .version4)

        #expect(size == [0x3, 0x2])
    }
}
