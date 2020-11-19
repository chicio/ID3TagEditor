//
//  ID3PictureTypeAdapterTest.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3PictureTypeAdapterTest: XCTestCase {
    func testExtractTypeFromV2TagJpg() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .jpeg, version: .version2), .frontCover)
    }

    func testExtractTypeFromV2TagPng() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .png, version: .version2), .frontCover)
    }

    func testExtractTypeFromV3TagJpg() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .jpeg, version: .version3), .frontCover)
    }

    func testExtractTypeFromV3TagPng() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x03, 0x00, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .png, version: .version3), .frontCover)
    }

    static let allTests = [
        ("testExtractTypeFromV2TagJpg", testExtractTypeFromV2TagJpg),
        ("testExtractTypeFromV2TagPng", testExtractTypeFromV2TagPng),
        ("testExtractTypeFromV3TagJpg", testExtractTypeFromV3TagJpg),
        ("testExtractTypeFromV3TagPng", testExtractTypeFromV3TagPng)
    ]
}
