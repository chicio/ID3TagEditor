//
//  ID3TagEditorAcceptanceTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorAcceptanceTest: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    func testFailWrongFilePathFilePath() {
        XCTAssertThrowsError(try id3TagEditor.read(from: "::a wrong path::"))
        XCTAssertThrowsError(try id3TagEditor.write(tag: ID3Tag(version: .version2,frames: [:]), to: ""))
    }
    
    //MARK: read
    
    func testReadTagV2() {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.Title]?.id3Identifier, "TT2")
        XCTAssertEqual(id3Tag?.frames[.Title]?.size, 35)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "example song")
        XCTAssertEqual(id3Tag?.frames[.Album]?.id3Identifier, "TAL")
        XCTAssertEqual(id3Tag?.frames[.Album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "example album")
        XCTAssertEqual(id3Tag?.frames[.AlbumArtist]?.id3Identifier, "TP2")
        XCTAssertEqual(id3Tag?.frames[.AlbumArtist]?.size, 51)
        XCTAssertEqual((id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "example album artist")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.id3Identifier, "TP1")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "example artist")
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.FrontCover)]?.id3Identifier, "PIC")
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.FrontCover)]?.size, 32003)
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
        XCTAssertEqual(id3Tag?.frames[.Title]?.id3Identifier, "TIT2")
        XCTAssertEqual(id3Tag?.frames[.Title]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual(id3Tag?.frames[.Album]?.id3Identifier, "TALB")
        XCTAssertEqual(id3Tag?.frames[.Album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.id3Identifier, "TPE1")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual(id3Tag?.frames[.AlbumArtist]?.id3Identifier, "TPE2")
        XCTAssertEqual(id3Tag?.frames[.AlbumArtist]?.size, 51)
        XCTAssertEqual((id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "A New Album Artist")
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.FrontCover)]?.id3Identifier, "APIC")
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.FrontCover)]?.size, 32015)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, coverFront)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.BackCover)]?.id3Identifier, "APIC")
        XCTAssertEqual(id3Tag?.frames[.AttachedPicture(.BackCover)]?.size, 83384)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.picture, coverBack)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.type, .BackCover)
        XCTAssertEqual((id3Tag?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual(id3Tag?.frames[.Genre]?.id3Identifier, "TCON")
        XCTAssertEqual(id3Tag?.frames[.Genre]?.size, 24)
        XCTAssertEqual((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.identifier, .Metal)
        XCTAssertEqual((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual(id3Tag?.frames[.TrackPosition]?.id3Identifier, "TRCK")
        XCTAssertEqual(id3Tag?.frames[.TrackPosition]?.size, 15)
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual(id3Tag?.frames[.RecordingDayMonth]?.id3Identifier, "TDAT")
        XCTAssertEqual(id3Tag?.frames[.RecordingDayMonth]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3Tag?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual(id3Tag?.frames[.RecordingYear]?.id3Identifier, "TYER")
        XCTAssertEqual(id3Tag?.frames[.RecordingYear]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2018)
        XCTAssertEqual(id3Tag?.frames[.RecordingHourMinute]?.id3Identifier, "TIME")
        XCTAssertEqual(id3Tag?.frames[.RecordingHourMinute]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3Tag?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
    }
    
    func testReadTagV4() {
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual(id3Tag?.frames[.Title]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.id3Identifier, "TIT2")
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual(id3Tag?.frames[.Album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.id3Identifier, "TALB")
        XCTAssertEqual((id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.id3Identifier, "TPE1")
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
    }
    
    func testReadTagV4WithImage() {
        let path = PathLoader().pathFor(name: "cover-v4", fileType: "png")
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual(id3Tag?.frames[.Artist]?.id3Identifier, "TPE1")
        XCTAssertEqual(id3Tag?.frames[.Artist]?.size, 19)
        XCTAssertEqual((id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "MATRANG")
        XCTAssertEqual(id3Tag?.frames[.Title]?.id3Identifier, "TIT2")
        XCTAssertEqual(id3Tag?.frames[.Title]?.size, 24)
        XCTAssertEqual((id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content, "Медуза")
        XCTAssertEqual(id3Tag?.frames[.Genre]?.id3Identifier, "TCON")
        XCTAssertEqual(id3Tag?.frames[.Genre]?.size, 19)
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
        XCTAssertEqual((id3Tag?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 10)
    }
    
    func testReadNewFramesV2() {
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V2")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TP3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V2")
        XCTAssertEqual(id3Tag?.frames[.ContentGrouping]?.id3Identifier, "TT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V2")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCR")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V2")
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TEN")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSS")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual(id3Tag?.frames[.MixArtist]?.id3Identifier, "TP4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V2")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPA")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
    }
    
    func testReadNewFramesV3() {
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V3")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V3")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V3")
        XCTAssertEqual(id3Tag?.frames[.ContentGrouping]?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPOS")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesGrouping]?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual(id3Tag?.frames[.MixArtist]?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V3")
        XCTAssertEqual(id3Tag?.frames[.FileOwner]?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesMovementName]?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesMovementIndex]?.id3Identifier, "MVIN")
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual(id3Tag?.frames[.iTunesPodcastCategory]?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesPodcastDescription]?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesPodcastID]?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesPodcastKeywords]?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
    }
    
    func testReadNewFramesV4() {
        let id3Tag = try! id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3"))
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V4")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V4")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V4")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V4")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
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
            ]
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
            ]
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
            ]
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
            ]
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
            ]
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
            ]
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
                .TrackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .RecordingYear : ID3FrameRecordingYear(year: 2018),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
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
                .TrackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .RecordingYear : ID3FrameRecordingYear(year: 2018),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
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
            ]
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
            ]
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
    
    func testWriteNewFramesV2() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v2-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V2"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V2"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V2"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V2"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V2"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V2"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V2"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V2"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V2"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteNewFramesV3() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v3-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V3"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V3"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V3"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .iTunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .iTunesMovementName : ID3FrameWithStringContent(content: "MovementName V3"),
                .iTunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .iTunesPodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .iTunesPodcastID : ID3FrameWithStringContent(content: "PodcastID V3"),
                .iTunesPodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V3"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteNewFramesV4() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v4-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V4"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V4"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V4"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V4"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V4"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V4"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V4"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V4"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V4"),
                .iTunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V4"),
                .iTunesMovementName : ID3FrameWithStringContent(content: "MovementName V4"),
                .iTunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V4"),
                .iTunesPodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V4"),
                .iTunesPodcastID : ID3FrameWithStringContent(content: "PodcastID V4"),
                .iTunesPodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V4"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testFramesAfterAttachdPicturesAreWritten() {
        let path = PathLoader().pathFor(name: "folder", fileType: "jpg")
        let pathMp3Generated = NSHomeDirectory() + "/frames-after-attached-picture.mp3"
        let cover = try! Data(contentsOf: URL(fileURLWithPath: path))
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: cover, type: .FrontCover, format: .Jpeg),
            ]
        )
        
        let id3TagEditor = ID3TagEditor()
        
        XCTAssertNoThrow(try! id3TagEditor.write(tag: id3Tag,
                                                 to: PathLoader().pathFor(name: "frames-after-attached-picture", fileType: "mp3"),
                                                 andSaveTo: pathMp3Generated))
        
        let tag = try! id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
    }
    
    func testWriteTagV4SynchsafeIntegers() {
        let art: Data = try! Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4-synchsafe.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Png)
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        
        let id3TagWritten = try! id3TagEditor.read(from: pathMp3Generated)
        
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, art)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Png)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.size, 243723)
    }
    
    
    func testWriteUnsynchronisedLyrics() {
        let pathMp3Generated = NSHomeDirectory() + "/example-write-unsynched-lyrics-v3.mp3"
        
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .UnsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita,
                                                                          contentDescription: "CD",
                                                                          content: """
                        Lyrics
                        Multiline
                        Oh yeah!!
                    """)
            ]
        )
        
        try! id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )
        
        let id3TagWritten = try! id3TagEditor.read(from: pathMp3Generated)
        
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, """
                        Lyrics
                        Multiline
                        Oh yeah!!
                    """)
    }
}
