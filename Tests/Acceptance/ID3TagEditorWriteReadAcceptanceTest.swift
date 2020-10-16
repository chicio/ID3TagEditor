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
    
    func testReadWritev2() throws {
        let filename = "example-write-read-v2"
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/\(filename).mp3"
        
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .title: ID3FrameWithStringContent(content: "title V2"),
                .album: ID3FrameWithStringContent(content: "album V2"),
                .albumArtist: ID3FrameWithStringContent(content: "album artist V2"),
                .artist: ID3FrameWithStringContent(content: "artist V2"),
                .composer: ID3FrameWithStringContent(content: "composer V2"),
                .conductor: ID3FrameWithStringContent(content: "conductor V2"),
                .contentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V2"),
                .copyright : ID3FrameWithStringContent(content: "Copyright V2"),
                .encodedBy : ID3FrameWithStringContent(content: "EncodedBy V2"),
                .encoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .lyricist : ID3FrameWithStringContent(content: "Lyricist V2"),
                .mixArtist : ID3FrameWithStringContent(content: "MixArtist V2"),
                .publisher : ID3FrameWithStringContent(content: "Publisher V2"),
                .subtitle : ID3FrameWithStringContent(content: "Subtitle V2"),
                .genre :  ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .discPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .trackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .recordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingYear : ID3FrameRecordingYear(year: 2020),
                .recordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .attachedPicture(.frontCover) : ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover) : ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v2 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v2 eng unsync lyrics"),
            ]
        )
        
        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: filename, fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )
        
        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content, "title V2")
        XCTAssertEqual((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content, "album V2")
        XCTAssertEqual((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content, "album artist V2")
        XCTAssertEqual((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content, "artist V2")
        XCTAssertEqual((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content, "composer V2")
        XCTAssertEqual((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "conductor V2")
        XCTAssertEqual((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V2")
        XCTAssertEqual((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V2")
        XCTAssertEqual((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier, .metal)
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual((id3TagWritten?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type, .backCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "v2 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "v2 eng unsync lyrics")
    }
    
    func testReadWritev3() throws {
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/example-write-read-v3.mp3"

        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .title: ID3FrameWithStringContent(content: "title V3"),
                .album: ID3FrameWithStringContent(content: "album V3"),
                .albumArtist: ID3FrameWithStringContent(content: "album artist V3"),
                .artist: ID3FrameWithStringContent(content: "artist V3"),
                .composer: ID3FrameWithStringContent(content: "composer V3"),
                .conductor: ID3FrameWithStringContent(content: "conductor V3"),
                .contentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .encodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .encoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .fileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .mixArtist : ID3FrameWithStringContent(content: "MixArtist V3"),
                .publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .genre :  ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .discPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .trackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .recordingDayMonth : ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingYear : ID3FrameRecordingYear(year: 2020),
                .recordingHourMinute : ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .attachedPicture(.frontCover) : ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover) : ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"),
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

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content, "title V3")
        XCTAssertEqual((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content, "album V3")
        XCTAssertEqual((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content, "album artist V3")
        XCTAssertEqual((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content, "artist V3")
        XCTAssertEqual((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content, "composer V3")
        XCTAssertEqual((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "conductor V3")
        XCTAssertEqual((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V3")
        XCTAssertEqual((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V3")
        XCTAssertEqual((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier, .metal)
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual((id3TagWritten?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type, .backCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "v3 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "v3 eng unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
    }
    
    func testReadWritev4() throws {
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/example-write-read-v4.mp3"

        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .title: ID3FrameWithStringContent(content: "title V4"),
                .album: ID3FrameWithStringContent(content: "album V4"),
                .albumArtist: ID3FrameWithStringContent(content: "album artist V4"),
                .artist: ID3FrameWithStringContent(content: "artist V4"),
                .composer: ID3FrameWithStringContent(content: "composer V4"),
                .conductor: ID3FrameWithStringContent(content: "conductor V4"),
                .contentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .copyright : ID3FrameWithStringContent(content: "Copyright V4"),
                .encodedBy : ID3FrameWithStringContent(content: "EncodedBy V4"),
                .encoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .fileOwner : ID3FrameWithStringContent(content: "FileOwner V4"),
                .lyricist : ID3FrameWithStringContent(content: "Lyricist V4"),
                .mixArtist : ID3FrameWithStringContent(content: "MixArtist V4"),
                .publisher : ID3FrameWithStringContent(content: "Publisher V4"),
                .subtitle : ID3FrameWithStringContent(content: "Subtitle V4"),
                .genre :  ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .discPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .trackPosition : ID3FramePartOfTotal(part: 2, total: 9),
                .recordingDateTime : ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(date: RecordingDate(day: 15, month: 10, year: 2020),
                                                                                                    time: RecordingTime(hour: 21, minute: 50))),
                .attachedPicture(.frontCover) : ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover) : ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "V4 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "V4 eng unsync lyrics"),
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

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content, "title V4")
        XCTAssertEqual((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content, "album V4")
        XCTAssertEqual((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content, "album artist V4")
        XCTAssertEqual((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content, "artist V4")
        XCTAssertEqual((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content, "composer V4")
        XCTAssertEqual((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "conductor V4")
        XCTAssertEqual((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V4")
        XCTAssertEqual((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V4")
        XCTAssertEqual((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier, .metal)
        XCTAssertEqual((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day, 15)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month, 10)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year, 2020)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour, 21)
        XCTAssertEqual((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute, 50)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, artFront)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture, artBack)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type, .backCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, "V4 ita unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.language, .eng)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameUnsynchronisedLyrics)!.content, "V4 eng unsync lyrics")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V4")
        XCTAssertEqual((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V4")
    }
}
