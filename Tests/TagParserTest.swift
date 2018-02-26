//
//  ID3TagParser.swift
//
//  Created by Fabrizio Duroni on 22/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagParserTest: XCTestCase {
    private let tagParser = ID3TagParser(
            tagVersionParser: ID3TagVersionParser(),
            tagPresence: ID3TagPresence(id3TagConfiguration: ID3TagConfiguration()),
            tagSizeParser: ID3TagSizeParser(),
            frameSizeParser: ID3FrameSizeParser(
                    frameContentSizeParser: ID3FrameContentSizeParser(id3FrameConfiguration: ID3FrameConfiguration()),
                    id3FrameConfiguration: ID3FrameConfiguration()),
            frameContentParser: ID3FrameContentParser(
                    frameContentParsingOperations: ID3FrameContentParsingOperationFactory.make(),
                    id3FrameConfiguration: ID3FrameConfiguration()),
            id3TagConfiguration: ID3TagConfiguration())

    func testParseV2Tag() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example", fileType: "mp3"))!
        let cover = NSData(contentsOfFile: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))!
        let id3Tag = tagParser.parse(mp3: mp3)
        XCTAssertNotNil(id3Tag)
        XCTAssertEqual(id3Tag?.version, 2)
        XCTAssertEqual(id3Tag?.title, "example song")
        XCTAssertEqual(id3Tag?.album, "example album")
        XCTAssertEqual(id3Tag?.artist, "example artist")
        XCTAssertEqual(id3Tag?.artwork.isPNG, false)
        XCTAssertEqual(id3Tag?.artwork.art, cover)
    }

    func testParseV3Tag() {
        let mp3 = NSData(contentsOfFile: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))!
        let cover = NSData(contentsOfFile: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))!
        let id3Tag = tagParser.parse(mp3: mp3)
        XCTAssertNotNil(id3Tag)
        XCTAssertEqual(id3Tag?.version, 3)
        XCTAssertEqual(id3Tag?.title, "A New title")
        XCTAssertEqual(id3Tag?.album, "A New Album")
        XCTAssertEqual(id3Tag?.artist, "A New Artist")
        XCTAssertEqual(id3Tag?.artwork.isPNG, true)
        XCTAssertEqual(id3Tag?.artwork.art, cover)
    }
}
