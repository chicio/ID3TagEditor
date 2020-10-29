//
//  ID3AttachedPicturesFrameCreatorsTest.swift
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3AttachedPicturesFramesCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoImage() {
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: ID32v3TagBuilder().build())

        XCTAssertEqual(newTagBytes, [])
    }

    func testFrameCreationWithJpgForVersion2() {
        let attachedPictureFrame = ID3FrameAttachedPicture(
            picture: Data([0x10, 0x10]),
            type: .frontCover,
            format: .jpeg
        )
        let id3Tag = ID32v2TagBuilder()
            .attachedPicture(pictureType: .frontCover, frame: attachedPictureFrame)
            .build()
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(
                newTagBytes,
                [0x01, 0x02, 0x00, 0x4A, 0x50, 0x47, 0x03, 0x00, 0x10, 0x10]
        )
    }

    func testFrameCreationWithPngForVersion2() {
        let attachedPictureFrame = ID3FrameAttachedPicture(picture: Data([0x10, 0x10]), type: .frontCover, format: .png)
        let id3Tag = ID32v2TagBuilder()
            .attachedPicture(pictureType: .frontCover, frame: attachedPictureFrame)
            .build()
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(
                newTagBytes,
                [0x01, 0x02, 0x00, 0x50, 0x4E, 0x47, 0x03, 0x00, 0x10, 0x10]
        )
    }

    func testFrameCreationWithJpgForVersion3() {
        let attachedPictureFrame = ID3FrameAttachedPicture(
            picture: Data([0x10, 0x10]),
            type: .frontCover,
            format: .jpeg
        )
        let id3Tag = ID32v3TagBuilder()
            .attachedPicture(pictureType: .frontCover, frame: attachedPictureFrame)
            .build()
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(
                newTagBytes,
                [0x01, 0x02, 0x00, 0x69, 0x6D, 0x61, 0x67, 0x65, 0x2F,
                 0x6A, 0x70, 0x65, 0x67, 0x00, 0x03, 0x00, 0x10,
                 0x10]
        )
    }

    func testFrameCreationWithPngForVersion3() {
        let attachedPictureFrame = ID3FrameAttachedPicture(picture: Data([0x10, 0x10]), type: .frontCover, format: .png)
        let id3Tag = ID32v3TagBuilder()
            .attachedPicture(pictureType: .frontCover, frame: attachedPictureFrame)
            .build()
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(
                newTagBytes,
                [0x01, 0x02, 0x00, 0x69, 0x6D, 0x61, 0x67, 0x65, 0x2F,
                 0x70, 0x6E, 0x67, 0x00, 0x03, 0x00, 0x10, 0x10]
        )
    }

    func testFrameCreationWithPngForAnotherTypeOfCover() {
        let attachedPictureFrameFront = ID3FrameAttachedPicture(
            picture: Data([0x10, 0x10]),
            type: .frontCover,
            format: .png
        )
        let attachedPictureFrameBack = ID3FrameAttachedPicture(
            picture: Data([0x10, 0x10]),
            type: .backCover,
            format: .png
        )
        let id3Tag = ID32v3TagBuilder()
            .attachedPicture(pictureType: .frontCover, frame: attachedPictureFrameFront)
            .attachedPicture(pictureType: .backCover, frame: attachedPictureFrameBack)
            .build()
        let id3AttachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                        id3FrameConfiguration: ID3FrameConfiguration(),
                        id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                        frameHeaderCreator: MockFrameHeaderCreator()
                )
        )

        let newTagBytes = id3AttachedPictureFrameCreator.createFrames(id3Tag: id3Tag)

        XCTAssertEqual(
                newTagBytes,
                [0x01, 0x02, 0x00, 0x69, 0x6D, 0x61, 0x67, 0x65, 0x2F,
                 0x70, 0x6E, 0x67, 0x00, 0x03, 0x00, 0x10, 0x10,
                 0x01, 0x02, 0x00, 0x69,
                 0x6D, 0x61, 0x67, 0x65, 0x2F, 0x70, 0x6E, 0x67,
                 0x00, 0x04, 0x00, 0x10, 0x10]
        )
    }

    static let allTests = [
        ("testFrameCreationWithJpgForVersion2", testFrameCreationWithJpgForVersion2),
        ("testFrameCreationWithJpgForVersion3", testFrameCreationWithJpgForVersion3),
        ("testFrameCreationWithPngForAnotherTypeOfCover", testFrameCreationWithPngForAnotherTypeOfCover),
        ("testFrameCreationWithPngForVersion2", testFrameCreationWithPngForVersion2),
        ("testFrameCreationWithPngForVersion3", testFrameCreationWithPngForVersion3),
        ("testNoFrameCreationWhenThereIsNoImage", testNoFrameCreationWhenThereIsNoImage)
    ]
}
