//
//  ID3FrameContentSizeParserTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorTest: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    func testFailWrongFilePathFilePath() {
        XCTAssertThrowsError(try id3TagEditor.read(from: "::a wrong path::"))
        XCTAssertThrowsError(try id3TagEditor.write(tag: ID3Tag(version: .version2, size: 0), to: ""))
    }
    
    //MARK: read
    
    func testReadTagV2() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "example song")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "example album")
        XCTAssertEqual((id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "example album artist")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "example artist")
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
    }
    
    func testParseTagV3() {
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Png)
    }
    
    func testParseTagV3AdditionalData() {
        let pathFront = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let pathBack = PathLoader().pathFor(name: "cover2", fileType: "jpg")
        let coverFront = try! Data(contentsOf: URL(fileURLWithPath: pathFront))
        let coverBack = try! Data(contentsOf: URL(fileURLWithPath: pathBack))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v3-additional-data", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual((id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "A New Album Artist")
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, coverFront)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.picture, coverBack)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.type, .BackCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.identifier, .Metal)
        XCTAssertEqual((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FrameTrackPosition)?.position, 2)
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FrameTrackPosition)?.totalTracks, 9)
        XCTAssertEqual((id3Tag?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3Tag?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual((id3Tag?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2018)
        XCTAssertEqual((id3Tag?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3Tag?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
    }
    
    func testReadTagV4() {
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
    }
    
    func testReadTagV4WithImage() {
        let path = PathLoader().pathFor(name: "cover-v4", fileType: "png")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "MATRANG")
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "Медуза")
        XCTAssertEqual(id3Tag?.frames[.Genre] as? ID3FrameGenre, ID3FrameGenre(genre: nil, description: "Hip-Hop"))
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Png)
    }
    
    func testReadAsMp3() {
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        let mp3 = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3")))
        
        let id3Tag = try! id3TagEditor.read(mp3: mp3)
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Png)
    }
    
    func testReadInvalidFile() {
        let mp3 = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-corrupted", fileType: "mp3")))
        
        XCTAssertThrowsError(try id3TagEditor.read(mp3: mp3))
    }
    
    func testReadUtf16String() {
        let id3TagEditor = ID3TagEditor()
        let pathMp3 = PathLoader().pathFor(name: "example-utf16", fileType: "mp3")
        
        let id3Tag = try! id3TagEditor.read(from: pathMp3)
        
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "Om Tryumbacom")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "Laraaji")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "Vision Songs Vol. 1")
        XCTAssertEqual((id3Tag?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2018)
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FrameTrackPosition)?.position, 10)
    }
    
    
    //MARK: write
    
    func testWriteTagV2() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v2.mp3"
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "example artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "example album artist"),
                .Album : ID3FrameWithStringContent(content: "example album"),
                .Title : ID3FrameWithStringContent(content: "example song"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteTagV3WhenItAlreadyExists() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-already-exists.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-with-tag-already-setted", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteTagV3WithJpg() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v3-jpg.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteTagV3WithPng() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Png)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: NSHomeDirectory() + "/example-v3-png.mp3"
            ))
    }
    
    func testWriteTagV3WithCustomPathThatDoesNotExists() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3Generated = NSHomeDirectory() + "/ID3TagEditor/example-v3-custom-path.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
    }
    
    func testWriteTagV3WithSamePath() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified-in-same-path", fileType: "mp3")
        ))
    }
    
    func testWriteTagV3WithAdditionalData() {
        let artFront: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v3-additional-data", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v3-additional-data.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: artFront, type: .FrontCover, format: .Jpeg),
                .AttachedPicture(.BackCover) : ID3FrameAttachedPicture(picture: artBack, type: .BackCover, format: .Jpeg),
                .Genre :  ID3FrameGenre(genre: .Metal, description: "Metalcore"),
                .TrackPosition : ID3FrameTrackPosition(position: 2, totalTracks: 9),
                .RecordingYear : ID3FrameRecordingYear(year: 2018),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: NSHomeDirectory() + "/example-v3-additional-data.mp3"
            ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteTagV3ToMp3AsData() {
        let artFront: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: artFront, type: .FrontCover, format: .Jpeg),
                .AttachedPicture(.BackCover) : ID3FrameAttachedPicture(picture: artBack, type: .BackCover, format: .Jpeg),
                .Genre :  ID3FrameGenre(genre: .Metal, description: "Metalcore"),
                .TrackPosition : ID3FrameTrackPosition(position: 2, totalTracks: 9),
                .RecordingYear : ID3FrameRecordingYear(year: 2018),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        let mp3 = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                                  fileType: "mp3")))
        
        let newMp3 = try! id3TagEditor.write(tag: id3Tag, mp3: mp3)
        
        XCTAssertEqual(
            newMp3,
            try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                            fileType: "mp3")))
        )
    }
    
    func testWriteTagV4() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v4", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteTagV4WithPng() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v4-additional-data", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4-with-png.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "A New Artist"),
                .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
                .Album : ID3FrameWithStringContent(content: "A New Album"),
                .Title : ID3FrameWithStringContent(content:  "A New title"),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Png)
            ],
            album: nil,
            title: nil,
            recordingDateTime: nil,
            genre: nil,
            attachedPictures: nil,
            trackPosition: nil
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
}
