//
//  AttachedPictureFrameContentParsingOperationTest.swift
//
//  Created by Fabrizio Duroni on 02/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3AttachedPictureFrameContentParsingOperationTest: XCTestCase {
    func testSetTagAttachedPicturePng() {
        let expectation = XCTestExpectation(description: "attached picture")
        let attachedPictureFrameContentParsingOperation = ID3AttachedPictureFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration(),
                pictureTypeAdapter: MockPictureTypeAdapter()
        )

        attachedPictureFrameContentParsingOperation.parse(
            frame: Data([0x89, 0x50, 0x4E, 0x47, 0x11, 0x11]),
            version: .version3,
            completed: {(frameName, frame) in
                    XCTAssertEqual(frameName, .attachedPicture(.frontCover))
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.format, .png)
                    XCTAssertEqual(
                        (frame as? ID3FrameAttachedPicture)?.picture,
                        Data([0x89, 0x50, 0x4E, 0x47, 0x11, 0x11])
                    )
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.type, .frontCover)
                    expectation.fulfill()
        })
    }

    func testSetTagAttachedPictureJpg() {
        let expectation = XCTestExpectation(description: "attached picture")
        let attachedPictureFrameContentParsingOperation = ID3AttachedPictureFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration(),
                pictureTypeAdapter: MockPictureTypeAdapter()
        )

        attachedPictureFrameContentParsingOperation.parse(
                frame: Data([0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11]),
                version: .version3,
                completed: {(frameName, frame) in
                    XCTAssertEqual(frameName, .attachedPicture(.frontCover))
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.format, .jpeg)
                    XCTAssertEqual(
                        (frame as? ID3FrameAttachedPicture)?.picture,
                        Data([0xFF, 0xD8, 0xFF, 0xE0, 0x11, 0x11])
                    )
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.type, .frontCover)
                    expectation.fulfill()
        })
    }

    func testSetTagAttachedPictureNonstandard() {
        let expectation = XCTestExpectation(description: "attached picture")
        let expectedMagicNumber = Data([0x01, 0x02, 0x03, 0x04])
        let frameData = Data([
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // header
                            0x00, // Text encoding
                            0x00, // string terminator
                            0x03, // image type (front cover)
                            0x00  // string terminator
                            ]
            ) + expectedMagicNumber + Data([0x11, 0x11]) // image data
        let attachedPictureFrameContentParsingOperation = ID3AttachedPictureFrameContentParsingOperation(
                id3FrameConfiguration: ID3FrameConfiguration(),
                pictureTypeAdapter: MockPictureTypeAdapter()
        )

        attachedPictureFrameContentParsingOperation.parse(
                frame: frameData,
                version: .version3,
                completed: {(frameName, frame) in
                    XCTAssertEqual(frameName, .attachedPicture(.frontCover))
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.format, .nonStandard)
                    XCTAssertEqual(
                        (frame as? ID3FrameAttachedPicture)?.picture,
                        expectedMagicNumber + Data([0x11, 0x11])
                    )
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.type, .frontCover)
                    XCTAssertEqual((frame as? ID3FrameAttachedPicture)?.magicNumber, expectedMagicNumber)
                    expectation.fulfill()
        })
    }

    static let allTests = [
        ("testSetTagAttachedPictureJpg", testSetTagAttachedPictureJpg),
        ("testSetTagAttachedPicturePng", testSetTagAttachedPicturePng),
        ("testSetTagAttachedPictureNonstandard", testSetTagAttachedPictureNonstandard)
    ]
}
