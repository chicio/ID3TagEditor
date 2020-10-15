//
//  ID3UnsyncronizedLyricsFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3UnsyncronizedLyricsFrameCreatorTest: XCTestCase {
    func testNothingIsCreatedWheLyricsDataIsNotSet() {
        let creator = ID3UnsyncronizedLyricsFrameCreator(unsynchronisedLyricForLanguageFrameCreator: MockUnsynchronisedLyricForLanguageFrameCreator())
        
        let frame = creator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [:]), tag: [])
        
        XCTAssertEqual(frame, [])
    }
    
    func testCreateFrameForValidData() {
        let creator = ID3UnsyncronizedLyricsFrameCreator(unsynchronisedLyricForLanguageFrameCreator: MockUnsynchronisedLyricForLanguageFrameCreator())
        
        let frame = creator.createFrames(id3Tag: ID3Tag(version: .version3, frames: [.UnsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: .ita, contentDescription: "decription", content: "content")]), tag: [])
        
        XCTAssertEqual(frame, [0x01])
    }
}
