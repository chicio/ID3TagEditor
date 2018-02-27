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
    
    func test_init() {
        XCTAssertNoThrow(try ID3TagEditor(path: pathFor(name: "example", fileType: "mp3")))
        XCTAssertThrowsError(try ID3TagEditor(path: "::a wrong path::"))
    }
    
    func test_getArtwork() {
        let artwork = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3")).getArtwork();
        XCTAssertNotNil(artwork)
        XCTAssertNoThrow(try artwork?.write(to: URL(fileURLWithPath: NSHomeDirectory() + "/cover.jpg")))
    }
    
    func testReadID3v22tag() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))
        XCTAssertEqual(mp3.getTitle(), "example song")
        XCTAssertEqual(mp3.getAlbum(), "example album")
        XCTAssertEqual(mp3.getArtist(), "example artist")
    }
    
    func testWriteID3withJpgAliceInChains() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "my-version", fileType: "mp3"));
        mp3.setTitle(title: "Your decision");
        mp3.setArtist(artist: "Alice In Chains");
        mp3.setAlbum(album: "Black Gives Way to Blue");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "folder", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false)
        XCTAssertNoThrow(try mp3.writeWithNewTag(to: NSHomeDirectory() + "/alice-in-chains-created.mp3"));
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/alice-in-chains-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "alice-in-chains-with-tag", fileType: "mp3"))
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteID3withJpgSampleSong() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false);
        XCTAssertNoThrow(try mp3.writeWithNewTag(to: NSHomeDirectory() + "/example-created.mp3"));
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/example-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "example-with-tag", fileType: "mp3"))
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteID4withJpgSampleSong() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "lb-mine", fileType: "mp3"));
        mp3.setTitle(title: "Loser");
        mp3.setArtist(artist: "Limp bizkit");
        mp3.setAlbum(album: "Gold Cobra");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "cover2", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false);
        XCTAssertNoThrow(try mp3.writeWithNewTag(to: NSHomeDirectory() + "/lb-mine.mp3"));
//        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/lb-mine.mp3")
//        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "lb-mine", fileType: "mp3"))
//        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }

    func testWriteIDWhenItAlreadyExists() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-with-tag-already-setted", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        mp3.setArtwork(artwork: data, isPNG: false);
        XCTAssertNoThrow(try mp3.writeWithNewTag(to: NSHomeDirectory() + "/lb-mine.mp3"));
        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/example-created.mp3")
        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "example-with-tag", fileType: "mp3"))
        XCTAssertEqual(mp3Created, mp3WithId3Tag)
    }
    
    func testWriteid3withPng() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        mp3.setTitle(title: "A New title");
        mp3.setArtist(artist: "A New Artist");
        mp3.setAlbum(album: "A New Album");
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover-png", fileType: "png")))
        mp3.setArtwork(artwork: data, isPNG: true);
        XCTAssertNoThrow(try mp3.writeWithNewTag(to: NSHomeDirectory() + "/lb-mine.mp3"));
    }

    func test_getAlbum() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"));
        XCTAssertEqual(mp3.getAlbum(), "example album");
    }
    
    func test_getArtist() {
        let mp3 = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"));
        XCTAssertEqual(mp3.getArtist(), "example artist");
    }
}

