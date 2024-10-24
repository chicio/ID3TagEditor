//
//  Mp3FileWriterTest.swift
//  ID3TagEditor
//
//  Created by Fabian Zwick on 18.10.24.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct Mp3FileWriterTest {
    @Test func testWritingWithCurrentTag() throws {
        let newTag = ID32v3TagBuilder()
            .title(frame: .init(content: "Test Title"))
            .album(frame: .init(content: "Test Album"))
            .build()

        let id3TagCreator = ID3TagCreatorFactory.make()
        let newId3TagData = try id3TagCreator.create(id3Tag: newTag)

        let fromPath = PathLoader().pathFor(name: "example", fileType: "mp3")
        let currentId3TagData = try Mp3FileReaderFactory.make().readID3TagFrom(path: fromPath)

        let pathMp3Generated =  NSHomeDirectory() + "/testWritingWithCurrentTagAndEqualToPath.mp3"
        #expect(throws: Never.self) { try Mp3FileWriter().write(newId3TagData: newId3TagData, currentId3TagData: currentId3TagData, fromPath: fromPath, toPath: pathMp3Generated) }

        let readTag = try ID3TagEditor().read(from: pathMp3Generated)
        #expect((readTag?.frames[.title] as? ID3FrameWithStringContent)?.content == "Test Title")
        #expect((readTag?.frames[.album] as? ID3FrameWithStringContent)?.content == "Test Album")
    }
}
