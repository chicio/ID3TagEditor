//
//  ID3FramesWithUserDefinedTextInformationCreatorTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Testing
@testable import ID3TagEditor

struct ID3FramesWithUserDefinedTextInformationCreatorTest {
    @Test func testNothingIsCreatedWhenUserDefinedTextInformationDataIsNotSet() {
        let creator = ID3FramesWithUserDefinedTextInformationCreator(
            userDefinedTextInformationFrameCreator: MockUserDefinedTextInformationFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: ID32v3TagBuilder().build())

        #expect(frame == [])
    }

    @Test func testCreateFrameForValidData() {
        let creator = ID3FramesWithUserDefinedTextInformationCreator(
            userDefinedTextInformationFrameCreator: MockUserDefinedTextInformationFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: aTagWithUserDefinedTextInformation())

        #expect(frame == [0x01])
    }

    @Test func testCreateMultipleFramesForMultipleUserDefinedTextInformation() {
        let creator = ID3FramesWithUserDefinedTextInformationCreator(
            userDefinedTextInformationFrameCreator: MockUserDefinedTextInformationFrameCreator()
        )

        let frame = creator.createFrames(id3Tag: aTagWithMultipleUserDefinedTextInformation())

        #expect(frame == [0x01, 0x01])
    }

    private func aTagWithUserDefinedTextInformation() -> ID3Tag {
        return ID32v3TagBuilder()
            .userDefinedTextInformation(description: "Custom Field", frame: ID3FrameUserDefinedTextInformation(
                description: "Custom Field",
                content: "Custom Value"
            ))
            .build()
    }

    private func aTagWithMultipleUserDefinedTextInformation() -> ID3Tag {
        return ID32v3TagBuilder()
            .userDefinedTextInformation(description: "Field1", frame: ID3FrameUserDefinedTextInformation(
                description: "Field1",
                content: "Value1"
            ))
            .userDefinedTextInformation(description: "Field2", frame: ID3FrameUserDefinedTextInformation(
                description: "Field2",
                content: "Value2"
            ))
            .build()
    }
}

class MockUserDefinedTextInformationFrameCreator: UserDefinedTextInformationFrameCreator {
    func createFrame(using frame: ID3FrameUserDefinedTextInformation, version: ID3Version, frameType: FrameType) -> [UInt8] {
        return [0x01]
    }
}