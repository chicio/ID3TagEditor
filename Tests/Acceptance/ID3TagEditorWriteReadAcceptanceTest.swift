//
//  ID3TagEditorWriteReadAcceptanceTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 15.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorWriteReadAcceptanceTest: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    func testReadWritev2() {
        let filename = "example-write-read-v2"
        let artFront: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/\(filename).mp3"
        
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .Title: ID3FrameWithStringContent(content: "title V2"),
                .Album: ID3FrameWithStringContent(content: "album V2"),
                .AlbumArtist: ID3FrameWithStringContent(content: "album artist V2"),
                .Artist: ID3FrameWithStringContent(content: "artist V2"),
                .Composer: ID3FrameWithStringContent(content: "composer V2"),
                .Conductor: ID3FrameWithStringContent(content: "conductor V2"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V2"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V2"),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V2"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V2"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V2"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V2"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V2"),
                .Genre :  ID3FrameGenre(genre: .Metal, description: "Metalcore"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .TrackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingYear : ID3FrameRecordingYear(year: 2020),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: artFront, type: .FrontCover, format: .Jpeg),
                .AttachedPicture(.BackCover) : ID3FrameAttachedPicture(picture: artBack, type: .BackCover, format: .Jpeg),
                .UnsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v2 ita unsync lyrics"),
                .UnsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v2 eng unsync lyrics"),
            ]
        )
        
        try! id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: filename, fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )
        
        let id3TagWritten = try! id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.Title] as? ID3FrameWithStringContent)?.content, "title V2")
        XCTAssertEqual((id3TagWritten?.frames[.Album] as? ID3FrameWithStringContent)?.content, "album V2")
        XCTAssertEqual((id3TagWritten?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "album artist V2")
        XCTAssertEqual((id3TagWritten?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "artist V2")
        XCTAssertEqual((id3TagWritten?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "composer V2")
        XCTAssertEqual((id3TagWritten?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "conductor V2")
        XCTAssertEqual((id3TagWritten?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V2")
        XCTAssertEqual((id3TagWritten?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual((id3TagWritten?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual((id3TagWritten?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual((id3TagWritten?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V2")
        XCTAssertEqual((id3TagWritten?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual((id3TagWritten?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.identifier, .Metal)
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.type, .BackCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "v2 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "v2 eng unsync lyrics")
    }
    
    func testReadWritev3() {
        let artFront: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/example-write-read-v3.mp3"

        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Title: ID3FrameWithStringContent(content: "title V3"),
                .Album: ID3FrameWithStringContent(content: "album V3"),
                .AlbumArtist: ID3FrameWithStringContent(content: "album artist V3"),
                .Artist: ID3FrameWithStringContent(content: "artist V3"),
                .Composer: ID3FrameWithStringContent(content: "composer V3"),
                .Conductor: ID3FrameWithStringContent(content: "conductor V3"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V3"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .Genre :  ID3FrameGenre(genre: .Metal, description: "Metalcore"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .TrackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .RecordingYear : ID3FrameRecordingYear(year: 2020),
                .RecordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: artFront, type: .FrontCover, format: .Jpeg),
                .AttachedPicture(.BackCover) : ID3FrameAttachedPicture(picture: artBack, type: .BackCover, format: .Jpeg),
                .UnsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"),
                .UnsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"),
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

        try! id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try! id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.Title] as? ID3FrameWithStringContent)?.content, "title V3")
        XCTAssertEqual((id3TagWritten?.frames[.Album] as? ID3FrameWithStringContent)?.content, "album V3")
        XCTAssertEqual((id3TagWritten?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "album artist V3")
        XCTAssertEqual((id3TagWritten?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "artist V3")
        XCTAssertEqual((id3TagWritten?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "composer V3")
        XCTAssertEqual((id3TagWritten?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "conductor V3")
        XCTAssertEqual((id3TagWritten?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V3")
        XCTAssertEqual((id3TagWritten?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual((id3TagWritten?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual((id3TagWritten?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual((id3TagWritten?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V3")
        XCTAssertEqual((id3TagWritten?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual((id3TagWritten?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.identifier, .Metal)
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.type, .BackCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "v3 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "v3 eng unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
    }
    
    func testReadWritev4() {
        let artFront: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/example-write-read-v4.mp3"

        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Title: ID3FrameWithStringContent(content: "title V4"),
                .Album: ID3FrameWithStringContent(content: "album V4"),
                .AlbumArtist: ID3FrameWithStringContent(content: "album artist V4"),
                .Artist: ID3FrameWithStringContent(content: "artist V4"),
                .Composer: ID3FrameWithStringContent(content: "composer V4"),
                .Conductor: ID3FrameWithStringContent(content: "conductor V4"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V4"),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V4"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V4"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V4"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V4"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V4"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V4"),
                .Genre :  ID3FrameGenre(genre: .Metal, description: "Metalcore"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .TrackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .RecordingDateTime : ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(date: RecordingDate(day: 15, month: 10, year: 2020),
                                                                                                    time: RecordingTime(hour: 21, minute: 50))),
                .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: artFront, type: .FrontCover, format: .Jpeg),
                .AttachedPicture(.BackCover) : ID3FrameAttachedPicture(picture: artBack, type: .BackCover, format: .Jpeg),
                .UnsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "V4 ita unsync lyrics"),
                .UnsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "V4 eng unsync lyrics"),
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

        try! id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try! id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.Title] as? ID3FrameWithStringContent)?.content, "title V4")
        XCTAssertEqual((id3TagWritten?.frames[.Album] as? ID3FrameWithStringContent)?.content, "album V4")
        XCTAssertEqual((id3TagWritten?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "album artist V4")
        XCTAssertEqual((id3TagWritten?.frames[.Artist] as? ID3FrameWithStringContent)?.content, "artist V4")
        XCTAssertEqual((id3TagWritten?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "composer V4")
        XCTAssertEqual((id3TagWritten?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "conductor V4")
        XCTAssertEqual((id3TagWritten?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V4")
        XCTAssertEqual((id3TagWritten?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3TagWritten?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3TagWritten?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3TagWritten?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V4")
        XCTAssertEqual((id3TagWritten?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3TagWritten?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.identifier, .Metal)
        XCTAssertEqual((id3TagWritten?.frames[.Genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day, 15)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month, 10)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour, 21)
        XCTAssertEqual((id3TagWritten?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute, 50)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.type, .FrontCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.type, .BackCover)
        XCTAssertEqual((id3TagWritten?.frames[.AttachedPicture(.BackCover)] as? ID3FrameAttachedPicture)?.format, .Jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "V4 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.UnsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "V4 eng unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V4")
    }
}
