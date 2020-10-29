//
//  ID3EncoderSettingsFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3EncoderSettingsFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereAreNoEncoderSettings() {
        let id3EncoderSettingsFrameCreator = ID3EncoderSettingsFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: [],
                frameTypeToBeChecked: .encoderSettings
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3EncoderSettingsFrameCreator.createFrames(
            id3Tag: ID32v3TagBuilder().build()
        )

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWhenThereAreEncoderSettings() {
        let newFrameBytes: [UInt8] = [1, 1]
        let id3Tag = ID32v3TagBuilder()
            .encoderSettings(frame: ID3FrameWithStringContent(content: "::an example encoder settings::"))
            .build()

        let id3EncoderSettingsFrameCreator = ID3EncoderSettingsFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .encoderSettings
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )

        let newTagBytes = id3EncoderSettingsFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(newTagBytes, newFrameBytes)
    }

    static let allTests = [
        ("testFrameCreationWhenThereAreEncoderSettings", testFrameCreationWhenThereAreEncoderSettings),
        ("testNoFrameCreationWhenThereAreNoEncoderSettings", testNoFrameCreationWhenThereAreNoEncoderSettings)
    ]
}
