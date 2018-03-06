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
        let frame = Data(bytes: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .Jpeg, version: .version2), .FrontCover)
    }

    func testExtractTypeFromV2TagPng() {
        let frame = Data(bytes: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .Png, version: .version2), .FrontCover)
    }

    func testExtractTypeFromV3TagJpg() {
        let frame = Data(bytes: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .Jpeg, version: .version3), .FrontCover)
    }

    func testExtractTypeFromV3TagPng() {
        let frame = Data(bytes: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x03, 0x00, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        XCTAssertEqual(id3PictureTypeAdapter.adapt(frame: frame, format: .Png, version: .version3), .FrontCover)
    }
}
