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
    
    func testReadTagV2() {
        let cover = try! Data(
                contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))

        XCTAssertEqual(id3TagEditor.getVersion(), .version2)
        XCTAssertEqual(id3TagEditor.getTitle(), "example song")
        XCTAssertEqual(id3TagEditor.getAlbum(), "example album")
        XCTAssertEqual(id3TagEditor.getArtist(), "example artist")
        XCTAssertEqual(id3TagEditor.getArtwork()?.art, cover)
    }

    func testParseTagV3() {
        let cover = try! Data(
                contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-v23-png", fileType: "mp3"))

        XCTAssertEqual(id3TagEditor.getVersion(), .version3)
        XCTAssertEqual(id3TagEditor.getTitle(), "A New title")
        XCTAssertEqual(id3TagEditor.getAlbum(), "A New Album")
        XCTAssertEqual(id3TagEditor.getArtist(), "A New Artist")
        XCTAssertEqual(id3TagEditor.getArtwork()?.art, cover)
        XCTAssertEqual(id3TagEditor.getArtwork()?.isPNG, true)
    }

    func testParseTagV3AdditionalData() {
        let cover = try! Data(
                contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-v3-additional-data", fileType: "mp3"))

        XCTAssertEqual(id3TagEditor.getVersion(), .version3)
        XCTAssertEqual(id3TagEditor.getTitle(), "A New title")
        XCTAssertEqual(id3TagEditor.getAlbum(), "A New Album")
        XCTAssertEqual(id3TagEditor.getArtist(), "A New Artist")
        XCTAssertEqual(id3TagEditor.getArtwork()?.art, cover)
        XCTAssertEqual(id3TagEditor.getArtwork()?.isPNG, false)
        XCTAssertEqual(id3TagEditor.getGenre()?.genre, .Metal)
        XCTAssertEqual(id3TagEditor.getGenre()?.description, "Metalcore")
        XCTAssertEqual(id3TagEditor.getYear(), "2018")
    }
    
    func testGenerateTagWhenItAlreadyExists() {
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-with-tag-already-setted", fileType: "mp3"));
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(
            artwork: try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg"))),
            isPNG: false
        );
        
        XCTAssertEqual(
            try id3TagEditor.generate(),
            try Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")))
        )
    }

    func testWriteTagWhenItAlreadyExists() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-with-tag-already-setted", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(artwork: data, isPNG: false);

        XCTAssertNoThrow(try id3TagEditor.write(to: NSHomeDirectory() + "/example-tag-already-exists.mp3"));
    }
    
    func testGenerateTagWithJpg() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(artwork: data, isPNG: false);
        
        XCTAssertEqual(
            try id3TagEditor.generate(),
            try Data(contentsOf: URL(fileURLWithPath:pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")))
        )
    }

    func testWriteTagWithJpg() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(artwork: data, isPNG: false);

        XCTAssertNoThrow(try id3TagEditor.write(to: NSHomeDirectory() + "/example-v3-jpg.mp3"));
    }
    
    func testWriteTagWithPng() {
        let data: Data = try! Data(
            contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover-png", fileType: "png"))
        )
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(artwork: data, isPNG: true);
        
        XCTAssertNoThrow(try id3TagEditor.write(to: NSHomeDirectory() + "/example-v3-png.mp3"));
    }

    func testWriteTagWithCustomPathThatDoesNotExists() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"))
        id3TagEditor.set(title: "A New title")
        id3TagEditor.set(artist: "A New Artist")
        id3TagEditor.set(album: "A New Album")
        id3TagEditor.set(artwork: data, isPNG: false)

        XCTAssertNoThrow(try id3TagEditor.write(to: NSHomeDirectory() + "/ID3TagEditor/example-v3-custom-path.mp3"));
    }

    func testWriteTagWithSamePath() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified-in-same-path", fileType: "mp3"))
        id3TagEditor.set(title: "A New title")
        id3TagEditor.set(artist: "A New Artist")
        id3TagEditor.set(album: "A New Album")
        id3TagEditor.set(artwork: data, isPNG: false)

        XCTAssertNoThrow(try id3TagEditor.write())
    }

    func testGenerateTagWithAdditionalData() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(year: "2018")
        id3TagEditor.set(genre: Genre(genre: .Metal, description: "Metalcore"))
        id3TagEditor.set(artwork: data, isPNG: false);

        XCTAssertEqual(
                try id3TagEditor.generate(),
                try Data(contentsOf: URL(fileURLWithPath:pathFor(name: "example-v3-additional-data", fileType: "mp3")))
        )
    }

    func testWriteTagWithAdditionalData() {
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "example-cover", fileType: "jpg")))
        let id3TagEditor = try! ID3TagEditor(path: pathFor(name: "example-to-be-modified", fileType: "mp3"));
        id3TagEditor.set(title: "A New title");
        id3TagEditor.set(artist: "A New Artist");
        id3TagEditor.set(album: "A New Album");
        id3TagEditor.set(year: "2018")
        id3TagEditor.set(genre: Genre(genre: .Metal, description: "Metalcore"))
        id3TagEditor.set(artwork: data, isPNG: false);

        XCTAssertNoThrow(try id3TagEditor.write(to: NSHomeDirectory() + "/example-v3-additional-data.mp3"));
    }

    //TODO: from here to be removed

//    func testWriteID3withJpgAliceInChains() {
//        let mp3 = try! ID3TagEditor(path: pathFor(name: "my-version", fileType: "mp3"));
//        mp3.setTitle(title: "Your decision");
//        mp3.setArtist(artist: "Alice In Chains");
//        mp3.setAlbum(album: "Black Gives Way to Blue");
//        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "folder", fileType: "jpg")))
//        mp3.setArtwork(artwork: data, isPNG: false)
//        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/alice-in-chains-created.mp3"));
//        let mp3Created = NSData(contentsOfFile: NSHomeDirectory() + "/alice-in-chains-created.mp3")
//        let mp3WithId3Tag = NSData(contentsOfFile: pathFor(name: "alice-in-chains-with-tag", fileType: "mp3"))
//        XCTAssertEqual(mp3Created, mp3WithId3Tag)
//    }
//
//    func testWriteID4withJpgSampleSong() {
//        let mp3 = try! ID3TagEditor(path: pathFor(name: "lb-mine", fileType: "mp3"));
//        mp3.setTitle(title: "Loser");
//        mp3.setArtist(artist: "Limp bizkit");
//        mp3.setAlbum(album: "Gold Cobra");
//        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: pathFor(name: "cover2", fileType: "jpg")))
//        mp3.setArtwork(artwork: data, isPNG: false);
//        XCTAssertNoThrow(try mp3.write(to: NSHomeDirectory() + "/lb-mine.mp3"));
//    }
}
