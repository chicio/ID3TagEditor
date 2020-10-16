//
//  ID3TagEditorAcceptanceTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable type_body_length

import XCTest
@testable import ID3TagEditor

class ID3TagEditorAcceptanceTest: XCTestCase {
    let id3TagEditor = ID3TagEditor()

    func testFailWrongFilePathFilePath() {
        XCTAssertThrowsError(try id3TagEditor.read(from: "::a wrong path::"))
        XCTAssertThrowsError(try id3TagEditor.write(tag: ID3Tag(version: .version2, frames: [:]), to: ""))
    }

    // MARK: read

    func testReadTagV2() throws {
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.title]?.id3Identifier, "TT2")
        XCTAssertEqual(id3Tag?.frames[.title]?.size, 35)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "example song")
        XCTAssertEqual(id3Tag?.frames[.album]?.id3Identifier, "TAL")
        XCTAssertEqual(id3Tag?.frames[.album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "example album")
        XCTAssertEqual(id3Tag?.frames[.albumArtist]?.id3Identifier, "TP2")
        XCTAssertEqual(id3Tag?.frames[.albumArtist]?.size, 51)
        XCTAssertEqual((id3Tag?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content, "example album artist")
        XCTAssertEqual(id3Tag?.frames[.artist]?.id3Identifier, "TP1")
        XCTAssertEqual(id3Tag?.frames[.artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "example artist")
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.frontCover)]?.id3Identifier, "PIC")
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.frontCover)]?.size, 32003)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
    }

    func testParseTagV3() throws {
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .png)
    }

    func testParseTagV3AdditionalData() throws {
        let pathFront = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let pathBack = PathLoader().pathFor(name: "cover2", fileType: "jpg")
        let coverFront = try Data(contentsOf: URL(fileURLWithPath: pathFront))
        let coverBack = try Data(contentsOf: URL(fileURLWithPath: pathBack))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v3-additional-data", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.title]?.id3Identifier, "TIT2")
        XCTAssertEqual(id3Tag?.frames[.title]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual(id3Tag?.frames[.album]?.id3Identifier, "TALB")
        XCTAssertEqual(id3Tag?.frames[.album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual(id3Tag?.frames[.artist]?.id3Identifier, "TPE1")
        XCTAssertEqual(id3Tag?.frames[.artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual(id3Tag?.frames[.albumArtist]?.id3Identifier, "TPE2")
        XCTAssertEqual(id3Tag?.frames[.albumArtist]?.size, 51)
        XCTAssertEqual((id3Tag?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content, "A New Album Artist")
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.frontCover)]?.id3Identifier, "APIC")
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.frontCover)]?.size, 32015)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, coverFront)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.backCover)]?.id3Identifier, "APIC")
        XCTAssertEqual(id3Tag?.frames[.attachedPicture(.backCover)]?.size, 83384)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture, coverBack)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type, .backCover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format, .jpeg)
        XCTAssertEqual(id3Tag?.frames[.genre]?.id3Identifier, "TCON")
        XCTAssertEqual(id3Tag?.frames[.genre]?.size, 24)
        XCTAssertEqual((id3Tag?.frames[.genre] as? ID3FrameGenre)?.identifier, .metal)
        XCTAssertEqual((id3Tag?.frames[.genre] as? ID3FrameGenre)?.description, "Metalcore")
        XCTAssertEqual(id3Tag?.frames[.trackPosition]?.id3Identifier, "TRCK")
        XCTAssertEqual(id3Tag?.frames[.trackPosition]?.size, 15)
        XCTAssertEqual((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part, 2)
        XCTAssertEqual((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total, 9)
        XCTAssertEqual(id3Tag?.frames[.recordingDayMonth]?.id3Identifier, "TDAT")
        XCTAssertEqual(id3Tag?.frames[.recordingDayMonth]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 5)
        XCTAssertEqual((id3Tag?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 8)
        XCTAssertEqual(id3Tag?.frames[.recordingYear]?.id3Identifier, "TYER")
        XCTAssertEqual(id3Tag?.frames[.recordingYear]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year, 2018)
        XCTAssertEqual(id3Tag?.frames[.recordingHourMinute]?.id3Identifier, "TIME")
        XCTAssertEqual(id3Tag?.frames[.recordingHourMinute]?.size, 16)
        XCTAssertEqual((id3Tag?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour, 15)
        XCTAssertEqual((id3Tag?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute, 39)
    }

    func testReadTagV4() throws {
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual(id3Tag?.frames[.title]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.id3Identifier, "TIT2")
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual(id3Tag?.frames[.album]?.size, 37)
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.id3Identifier, "TALB")
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual(id3Tag?.frames[.artist]?.size, 39)
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.id3Identifier, "TPE1")
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
    }

    func testReadTagV4WithImage() throws {
        let path = PathLoader().pathFor(name: "cover-v4", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual(id3Tag?.frames[.artist]?.id3Identifier, "TPE1")
        XCTAssertEqual(id3Tag?.frames[.artist]?.size, 19)
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "MATRANG")
        XCTAssertEqual(id3Tag?.frames[.title]?.id3Identifier, "TIT2")
        XCTAssertEqual(id3Tag?.frames[.title]?.size, 24)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "Медуза")
        XCTAssertEqual(id3Tag?.frames[.genre]?.id3Identifier, "TCON")
        XCTAssertEqual(id3Tag?.frames[.genre]?.size, 19)
        XCTAssertEqual(id3Tag?.frames[.genre] as? ID3FrameGenre, ID3FrameGenre(genre: nil, description: "Hip-Hop"))
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .png)
    }

    func testReadAsMp3() throws {
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))
        let mp3 = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23-png", fileType: "mp3")))

        let id3Tag = try id3TagEditor.read(mp3: mp3)

        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "A New title")
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "A New Album")
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "A New Artist")
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, cover)
        XCTAssertEqual((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .png)
    }

    func testReadInvalidFile() throws {
        let mp3 = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-corrupted", fileType: "mp3")))

        XCTAssertThrowsError(try id3TagEditor.read(mp3: mp3))
    }

    func testReadUtf16String() throws {
        let id3TagEditor = ID3TagEditor()
        let pathMp3 = PathLoader().pathFor(name: "example-utf16", fileType: "mp3")

        let id3Tag = try id3TagEditor.read(from: pathMp3)

        XCTAssertEqual((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content, "Om Tryumbacom")
        XCTAssertEqual((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content, "Laraaji")
        XCTAssertEqual((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content, "Vision Songs Vol. 1")
        XCTAssertEqual((id3Tag?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year, 2018)
        XCTAssertEqual((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part, 10)
    }

    func testReadNewFramesV2() throws {
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.composer]?.id3Identifier, "TCM")
        XCTAssertEqual((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content, "Composer V2")
        XCTAssertEqual(id3Tag?.frames[.conductor]?.id3Identifier, "TP3")
        XCTAssertEqual((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "Conductor V2")
        XCTAssertEqual(id3Tag?.frames[.contentGrouping]?.id3Identifier, "TT1")
        XCTAssertEqual((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V2")
        XCTAssertEqual(id3Tag?.frames[.copyright]?.id3Identifier, "TCR")
        XCTAssertEqual((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content, "Copyright V2")
        XCTAssertEqual(id3Tag?.frames[.encodedBy]?.id3Identifier, "TEN")
        XCTAssertEqual((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual(id3Tag?.frames[.encoderSettings]?.id3Identifier, "TSS")
        XCTAssertEqual((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual(id3Tag?.frames[.lyricist]?.id3Identifier, "TXT")
        XCTAssertEqual((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual(id3Tag?.frames[.mixArtist]?.id3Identifier, "TP4")
        XCTAssertEqual((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V2")
        XCTAssertEqual(id3Tag?.frames[.publisher]?.id3Identifier, "TPB")
        XCTAssertEqual((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual(id3Tag?.frames[.subtitle]?.id3Identifier, "TT3")
        XCTAssertEqual((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual(id3Tag?.frames[.discPosition]?.id3Identifier, "TPA")
        XCTAssertEqual((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
    }

    func testReadNewFramesV3() throws {
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.composer]?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content, "Composer V3")
        XCTAssertEqual(id3Tag?.frames[.conductor]?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "Conductor V3")
        XCTAssertEqual(id3Tag?.frames[.copyright]?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content, "Copyright V3")
        XCTAssertEqual(id3Tag?.frames[.contentGrouping]?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.discPosition]?.id3Identifier, "TPOS")
        XCTAssertEqual((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual(id3Tag?.frames[.encodedBy]?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual(id3Tag?.frames[.encoderSettings]?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual(id3Tag?.frames[.iTunesGrouping]?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.lyricist]?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual(id3Tag?.frames[.mixArtist]?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V3")
        XCTAssertEqual(id3Tag?.frames[.fileOwner]?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V3")
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
        XCTAssertEqual(id3Tag?.frames[.publisher]?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual(id3Tag?.frames[.subtitle]?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
    }

    func testReadNewFramesV4() throws {
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3"))

        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content, "Composer V4")
        XCTAssertEqual((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content, "Conductor V4")
        XCTAssertEqual((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content, "Copyright V4")
        XCTAssertEqual((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V4")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V4")
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
        XCTAssertEqual((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
    }

    // MARK: write

    func testWriteTagV2() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v2.mp3"
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .artist: ID3FrameWithStringContent(content: "example artist"),
                .albumArtist: ID3FrameWithStringContent(content: "example album artist"),
                .album: ID3FrameWithStringContent(content: "example album"),
                .title: ID3FrameWithStringContent(content: "example song"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .jpeg)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteTagV3WhenItAlreadyExists() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-already-exists.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .jpeg)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-with-tag-already-setted", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))

        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteTagV3WithJpg() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-with-tag-jpg-v3", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v3-jpg.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .jpeg)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteTagV3WithPng() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .png)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: NSHomeDirectory() + "/example-v3-png.mp3"
        ))
    }

    func testWriteTagV3WithCustomPathThatDoesNotExists() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let pathMp3Generated = NSHomeDirectory() + "/ID3TagEditor/example-v3-custom-path.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .jpeg)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
    }

    func testWriteTagV3WithSamePath() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .jpeg)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified-in-same-path", fileType: "mp3")
        ))
    }

    func testWriteTagV3WithAdditionalData() throws {
        let artFront: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v3-additional-data", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-v3-additional-data.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingYear: ID3FrameRecordingYear(year: 2018),
                .recordingDayMonth: ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: NSHomeDirectory() + "/example-v3-additional-data.mp3"
        ))
        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteTagV3ToMp3AsData() throws {
        let artFront: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingYear: ID3FrameRecordingYear(year: 2018),
                .recordingDayMonth: ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
        )
        let mp3 = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                                  fileType: "mp3")))

        let newMp3 = try id3TagEditor.write(tag: id3Tag, mp3: mp3)

        XCTAssertEqual(
            newMp3,
            try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                            fileType: "mp3")))
        )
    }

    func testWriteTagV4() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v4", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title")
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))

        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteTagV4WithPng() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-v4-additional-data", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4-with-png.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .artist: ID3FrameWithStringContent(content: "A New Artist"),
                .albumArtist: ID3FrameWithStringContent(content: "A New Album Artist"),
                .album: ID3FrameWithStringContent(content: "A New Album"),
                .title: ID3FrameWithStringContent(content: "A New title"),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .png)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))

        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteNewFramesV2() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v2-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .composer: ID3FrameWithStringContent(content: "Composer V2"),
                .conductor: ID3FrameWithStringContent(content: "Conductor V2"),
                .contentGrouping: ID3FrameWithStringContent(content: "ContentGrouping V2"),
                .copyright: ID3FrameWithStringContent(content: "Copyright V2"),
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .encodedBy: ID3FrameWithStringContent(content: "EncodedBy V2"),
                .encoderSettings: ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .lyricist: ID3FrameWithStringContent(content: "Lyricist V2"),
                .mixArtist: ID3FrameWithStringContent(content: "MixArtist V2"),
                .publisher: ID3FrameWithStringContent(content: "Publisher V2"),
                .subtitle: ID3FrameWithStringContent(content: "Subtitle V2")
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteNewFramesV3() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v3-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .composer: ID3FrameWithStringContent(content: "Composer V3"),
                .conductor: ID3FrameWithStringContent(content: "Conductor V3"),
                .contentGrouping: ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .copyright: ID3FrameWithStringContent(content: "Copyright V3"),
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .encodedBy: ID3FrameWithStringContent(content: "EncodedBy V3"),
                .encoderSettings: ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .fileOwner: ID3FrameWithStringContent(content: "FileOwner V3"),
                .lyricist: ID3FrameWithStringContent(content: "Lyricist V3"),
                .mixArtist: ID3FrameWithStringContent(content: "MixArtist V3"),
                .subtitle: ID3FrameWithStringContent(content: "Subtitle V3"),
                .publisher: ID3FrameWithStringContent(content: "Publisher V3"),
                .iTunesGrouping: ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .iTunesMovementName: ID3FrameWithStringContent(content: "MovementName V3"),
                .iTunesMovementIndex: ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount: ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory: ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .iTunesPodcastDescription: ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .iTunesPodcastID: ID3FrameWithStringContent(content: "PodcastID V3"),
                .iTunesPodcastKeywords: ID3FrameWithStringContent(content: "PodcastKeywords V3")
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))
        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testWriteNewFramesV4() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        let pathMp3Generated = NSHomeDirectory() + "/example-newframes-v4-generated.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .composer: ID3FrameWithStringContent(content: "Composer V4"),
                .conductor: ID3FrameWithStringContent(content: "Conductor V4"),
                .contentGrouping: ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .copyright: ID3FrameWithStringContent(content: "Copyright V4"),
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .encodedBy: ID3FrameWithStringContent(content: "EncodedBy V4"),
                .encoderSettings: ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .fileOwner: ID3FrameWithStringContent(content: "FileOwner V4"),
                .lyricist: ID3FrameWithStringContent(content: "Lyricist V4"),
                .mixArtist: ID3FrameWithStringContent(content: "MixArtist V4"),
                .publisher: ID3FrameWithStringContent(content: "Publisher V4"),
                .subtitle: ID3FrameWithStringContent(content: "Subtitle V4"),
                .iTunesGrouping: ID3FrameWithStringContent(content: "ItunesGrouping V4"),
                .iTunesMovementName: ID3FrameWithStringContent(content: "MovementName V4"),
                .iTunesMovementIndex: ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount: ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory: ID3FrameWithStringContent(content: "PodcastCategory V4"),
                .iTunesPodcastDescription: ID3FrameWithStringContent(content: "PodcastDescription V4"),
                .iTunesPodcastID: ID3FrameWithStringContent(content: "PodcastID V4"),
                .iTunesPodcastKeywords: ID3FrameWithStringContent(content: "PodcastKeywords V4")
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))

        XCTAssertEqual(
            try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }

    func testFramesAfterAttachdPicturesAreWritten() throws {
        let path = PathLoader().pathFor(name: "folder", fileType: "jpg")
        let pathMp3Generated = NSHomeDirectory() + "/frames-after-attached-picture.mp3"
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: cover, type: .frontCover, format: .jpeg)
            ]
        )

        let id3TagEditor = ID3TagEditor()

        XCTAssertNoThrow(try id3TagEditor.write(tag: id3Tag,
                                                 to: PathLoader().pathFor(name: "frames-after-attached-picture", fileType: "mp3"),
                                                 andSaveTo: pathMp3Generated))

        let tag = try id3TagEditor.read(from: pathMp3Generated)
        XCTAssertEqual((tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total, 3)
    }

    func testWriteTagV4SynchsafeIntegers() throws {
        let art: Data = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover-png", fileType: "png"))
        )
        let pathMp3Generated = NSHomeDirectory() + "/example-tag-v4-synchsafe.mp3"
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: art, type: .frontCover, format: .png)
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        ))

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)

        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture, art)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format, .png)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type, .frontCover)
        XCTAssertEqual((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.size, 243723)
    }

    func testWriteUnsynchronisedLyrics() throws {
        let pathMp3Generated = NSHomeDirectory() + "/example-write-unsynched-lyrics-v3.mp3"

        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .unsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita,
                                                                          contentDescription: "CD",
                                                                          content: """
                        Lyrics
                        Multiline
                        Oh yeah!!
                    """)
            ]
        )

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-write-unsynched-lyrics", fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)

        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.language, .ita)
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)?.contentDescription, "CD")
        XCTAssertEqual((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameUnsynchronisedLyrics)!.content, """
                        Lyrics
                        Multiline
                        Oh yeah!!
                    """)
    }
}
