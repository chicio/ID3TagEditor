//
//  ID3PictureTypeAdapterTest.swift
//
//  Created by Fabrizio Duroni on 06/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3PictureTypeAdapterTest {
    @Test func testExtractTypeFromV2TagJpg() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        #expect(id3PictureTypeAdapter.adapt(frame: frame, format: .jpeg, version: .version2) == .frontCover)
    }

    @Test func testExtractTypeFromV2TagPng() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        #expect(id3PictureTypeAdapter.adapt(frame: frame, format: .png, version: .version2) == .frontCover)
    }

    @Test func testExtractTypeFromV3TagJpg() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x03, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        #expect(id3PictureTypeAdapter.adapt(frame: frame, format: .jpeg, version: .version3) == .frontCover)
    }

    @Test func testExtractTypeFromV3TagPng() {
        let frame = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                 0x00, 0x03, 0x00, 0x00])
        let id3PictureTypeAdapter = ID3PictureTypeAdapter(
                id3FrameConfiguration: ID3FrameConfiguration(),
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
        )

        #expect(id3PictureTypeAdapter.adapt(frame: frame, format: .png, version: .version3) == .frontCover)
    }
}
