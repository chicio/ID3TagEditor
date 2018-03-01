//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorTest: XCTestCase {
    func pathFor(name: String, fileType: String) -> String {
        let bundle = Bundle(for: type(of: self));
        let path = bundle.path(forResource: name, ofType: fileType)!;
        return path;
    }
    
    func testInitWithFilePath() {
        XCTAssertNoThrow(try ID3TagEditor(path: pathFor(name: "example", fileType: "mp3")))
        XCTAssertThrowsError(try ID3TagEditor(path: "::a wrong path::"))
    }
    
    func testReadV2Tag() {
        let cover = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))

        XCTAssertEqual(id3TagEditor.getTitle(), "example song")
        XCTAssertEqual(id3TagEditor.getAlbum(), "example album")
        XCTAssertEqual(id3TagEditor.getArtist(), "example artist")
        XCTAssertEqual(id3TagEditor.getArtwork(), cover)
    }

    func testParseV3Tag() {
        let cover = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-v23-png", fileType: "mp3"))

        XCTAssertEqual(id3TagEditor.getTitle(), "A New title")
        XCTAssertEqual(id3TagEditor.getAlbum(), "A New Album")
        XCTAssertEqual(id3TagEditor.getArtist(), "A New Artist")
        XCTAssertEqual(id3TagEditor.getArtwork(), cover)
    }
    
    func testWriteID3withJpgAliceInChains() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "my-version", fileType: "mp3"));
        mp3.setTitle(title: "Your decision");
        mp3.setArtist(artist: "Alice In Chains");
        mp3.setAlbum(album: "Black Gives Way to Blue");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "folder", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false)
        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/alice-in-chains-created.mp3"));
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/alice-in-chains-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "alice-in-chains-with-tag", fileType: "mp3"))
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteID3withJpgSampleSong() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/example-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "example-with-tag", fileType: "mp3"))
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        mp3.setArtwork(artwork: data, isPNG: false);

        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/example-created.mp3"));
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteID4withJpgSampleSong() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "lb-mine", fileType: "mp3"));
        mp3.setTitle(title: "Loser");
        mp3.setArtist(artist: "Limp bizkit");
        mp3.setAlbum(album: "Gold Cobra");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "cover2", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false);
        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/lb-mine.mp3"));
//        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/lb-mine.mp3")
//        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "lb-mine", fileType: "mp3"))
//        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }

    func testWriteIDWhenItAlreadyExists() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/example-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "example-with-tag", fileType: "mp3"))
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-with-tag-already-setted", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        mp3.setArtwork(artwork: data, isPNG: false);

        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/lb-mine-2.mp3"));
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteid3withPng() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover-png", fileType: "png")))
        mp3.setArtwork(artwork: data, isPNG: true);
        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/lb-mine.mp3"));
    }
}
