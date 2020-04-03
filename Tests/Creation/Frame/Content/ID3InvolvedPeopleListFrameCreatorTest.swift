//
//  ID3InvolvedPeopleListFrameCreatorTest.swift
//
//  Created by Nolaine Crusher on 04/03/2020.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3InvolvedPeopleListFrameCreatorTest: XCTestCase {
    func testNoFrameCreationWhenThereIsNoInvolvedPeopleList() {
        let tagBytes: [UInt8] = [1, 1, 1]
        
        let id3InvolvedPeopleListFrameCreator = ID3InvolvedPeopleListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: MockStringToBytesAdapter()
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3InvolvedPeopleListFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: tagBytes)
        
        XCTAssertEqual(newTagBytes, tagBytes)
    }
    
    func testFrameCreationWhenThereIsAnInvolvedPeoplesListV3() {
        let newFrameBytes: [UInt8] = [
            0x49, 0x50, 0x4c, 0x53, // IPLS
            0x11, // Size (see MockFrameContentSizeCalculator)
            0x00, // Flags (see MockFrameFlagsCreator
            0x00, // Latin‐1
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, 0x00, // Musician
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Musician Name
        ]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [.InvolvedPeople: ID3FrameCreditsList(
                role: "Musician",
                person: "Musician Name")]
        )
        let configuration = ID3FrameConfiguration()
        let id3InvolvedPeopleListFrameCreator = ID3InvolvedPeopleListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                    paddingAdder: MockPaddingAdder(),
                    frameConfiguration: configuration
                )
            ),
            id3FrameConfiguration: configuration
        )
        
        let newTagBytes = id3InvolvedPeopleListFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
    
    func testFrameCreationWhenThereIsAnInvolvedPeoplesListV4() {
        let newFrameBytes: [UInt8] = [
            0x54, 0x49, 0x50, 0x4c, // TIPL
            0x11, // Size (see MockFrameContentSizeCalculator)
            0x00, // Flags (see MockFrameFlagsCreator
            0x00, // Latin‐1
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, 0x00, // Musician
            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Musician Name
        ]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [.InvolvedPeople: ID3FrameCreditsList(
                role: "Musician",
                person: "Musician Name")]
        )
        let configuration = ID3FrameConfiguration()
        let id3InvolvedPeopleListFrameCreator = ID3InvolvedPeopleListFrameCreator(
            frameCreator:
            ID3CreditsListFrameCreator(
                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
                frameFlagsCreator: MockFrameFlagsCreator(),
                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
                    paddingAdder: MockPaddingAdder(),
                    frameConfiguration: configuration
                )
            ),
            id3FrameConfiguration: configuration
        )
        
        let newTagBytes = id3InvolvedPeopleListFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
    
//    func testFrameCreationWhenThereAreMultipleRoles() {
//        let newFrameBytes: [UInt8] = [
//            0x54, 0x49, 0x50, 0x4c, // TIPL
//            0x11, // Size (see MockFrameContentSizeCalculator)
//            0x00, // Flags (see MockFrameFlagsCreator
//            0x00, // Latin‐1
//            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x00, 0x00, // Musician
//            0x4d, 0x75, 0x73, 0x69, 0x63, 0x69, 0x61, 0x6e, 0x20, 0x4e, 0x61, 0x6d, 0x65, 0x00, // Musician Name
//        ]
//        let tagAsBytes: [UInt8] = [1, 1, 1]
//        let id3Tag = ID3Tag(
//            version: .version4,
//            frames: [
//                .InvolvedPeople: ID3FrameCreditsList(
//                    role: "Musician",
//                    person: "Musician Name"),
//                .InvolvedPeople: ID3FrameCreditsList(
//                role: "Singer",
//                person: "Singer Name")
//            ]
//        )
//        let configuration = ID3FrameConfiguration()
//        let id3InvolvedPeopleListFrameCreator = ID3InvolvedPeopleListFrameCreator(
//            frameCreator:
//            ID3CreditsListFrameCreator(
//                frameContentSizeCalculator: MockFrameContentSizeCalculator(),
//                frameFlagsCreator: MockFrameFlagsCreator(),
//                stringToBytesAdapter: ID3ISO88591StringToByteAdapter(
//                    paddingAdder: MockPaddingAdder(),
//                    frameConfiguration: configuration
//                )
//            ),
//            id3FrameConfiguration: configuration
//        )
//        
//        let newTagBytes = id3InvolvedPeopleListFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
//        
//        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
//    }
    
}
