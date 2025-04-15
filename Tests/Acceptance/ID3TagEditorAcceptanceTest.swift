//
//  ID3TagEditorAcceptanceTest.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable type_body_length
// swiftlint:disable file_length
// swiftlint:disable function_body_length
// swiftlint:disable line_length

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagEditorAcceptanceTest {
    @Test func testFailWrongFilePathFilePath() {
        let id3TagEditor = ID3TagEditor()
        #expect(throws: ID3TagEditorError.invalidFileFormat.self) { try id3TagEditor.read(from: "::a wrong path::") }
        #expect(throws: ID3TagEditorError.invalidFileFormat.self) { try id3TagEditor.write(tag: ID32v2TagBuilder().build(), to: "") }
    }

    // MARK: read

    @Test func testReadTagV2() throws {
        let id3TagEditor = ID3TagEditor()
        let path = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))

        #expect(id3Tag?.properties.version == .version2)
        #expect(id3Tag?.frames[.title]?.id3Identifier == "TT2")
        #expect(id3Tag?.frames[.title]?.size == 35)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "example song")
        #expect(id3Tag?.frames[.album]?.id3Identifier == "TAL")
        #expect(id3Tag?.frames[.album]?.size == 37)
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "example album")
        #expect(id3Tag?.frames[.albumArtist]?.id3Identifier == "TP2")
        #expect(id3Tag?.frames[.albumArtist]?.size == 51)
        #expect((id3Tag?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content == "example album artist")
        #expect(id3Tag?.frames[.artist]?.id3Identifier == "TP1")
        #expect(id3Tag?.frames[.artist]?.size == 39)
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "example artist")
        #expect(id3Tag?.frames[.attachedPicture(.frontCover)]?.id3Identifier == "PIC")
        #expect(id3Tag?.frames[.attachedPicture(.frontCover)]?.size == 32003)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == cover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
    }

    @Test func testParseTagV3() throws {
        let id3TagEditor = ID3TagEditor()
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))

        #expect(id3Tag?.properties.version == .version3)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "A title")
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "An album")
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "An artist")
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == cover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .png)
    }

    @Test func testParseTagV3AdditionalData() throws {
        let id3TagEditor = ID3TagEditor()
        let pathFront = PathLoader().pathFor(name: "example-cover", fileType: "jpg")
        let pathBack = PathLoader().pathFor(name: "cover2", fileType: "jpg")
        let coverFront = try Data(contentsOf: URL(fileURLWithPath: pathFront))
        let coverBack = try Data(contentsOf: URL(fileURLWithPath: pathBack))

        let id3Tag = try id3TagEditor.read(
            from: PathLoader().pathFor(name: "example-v3-additional-data", fileType: "mp3")
        )

        #expect(id3Tag?.properties.version == .version3)
        #expect(id3Tag?.frames[.title]?.id3Identifier == "TIT2")
        #expect(id3Tag?.frames[.title]?.size == 37)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "A New title")
        #expect(id3Tag?.frames[.album]?.id3Identifier == "TALB")
        #expect(id3Tag?.frames[.album]?.size == 37)
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "A New Album")
        #expect(id3Tag?.frames[.artist]?.id3Identifier == "TPE1")
        #expect(id3Tag?.frames[.artist]?.size == 39)
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "A New Artist")
        #expect(id3Tag?.frames[.albumArtist]?.id3Identifier == "TPE2")
        #expect(id3Tag?.frames[.albumArtist]?.size == 51)
        #expect((id3Tag?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content == "A New Album Artist")
        #expect(id3Tag?.frames[.attachedPicture(.frontCover)]?.id3Identifier == "APIC")
        #expect(id3Tag?.frames[.attachedPicture(.frontCover)]?.size == 32015)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == coverFront)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect(id3Tag?.frames[.attachedPicture(.backCover)]?.id3Identifier == "APIC")
        #expect(id3Tag?.frames[.attachedPicture(.backCover)]?.size == 83384)
        #expect((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture == coverBack)
        #expect((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type == .backCover)
        #expect((id3Tag?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect(id3Tag?.frames[.genre]?.id3Identifier == "TCON")
        #expect(id3Tag?.frames[.genre]?.size == 24)
        #expect((id3Tag?.frames[.genre] as? ID3FrameGenre)?.identifier == .metal)
        #expect((id3Tag?.frames[.genre] as? ID3FrameGenre)?.description == "Metalcore")
        #expect(id3Tag?.frames[.trackPosition]?.id3Identifier == "TRCK")
        #expect(id3Tag?.frames[.trackPosition]?.size == 15)
        #expect((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part == 2)
        #expect((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total == 9)
        #expect(id3Tag?.frames[.recordingDayMonth]?.id3Identifier == "TDAT")
        #expect(id3Tag?.frames[.recordingDayMonth]?.size == 16)
        #expect((id3Tag?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day == 5)
        #expect((id3Tag?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month == 8)
        #expect(id3Tag?.frames[.recordingYear]?.id3Identifier == "TYER")
        #expect(id3Tag?.frames[.recordingYear]?.size == 16)
        #expect((id3Tag?.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value == 2018)
        #expect(id3Tag?.frames[.recordingHourMinute]?.id3Identifier == "TIME")
        #expect(id3Tag?.frames[.recordingHourMinute]?.size == 16)
        #expect((id3Tag?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour == 15)
        #expect((id3Tag?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute == 39)
    }

    @Test func testReadTagV4() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4", fileType: "mp3"))

        #expect(id3Tag?.properties.version == .version4)
        #expect(id3Tag?.frames[.title]?.size == 37)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.id3Identifier == "TIT2")
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "A New title")
        #expect(id3Tag?.frames[.album]?.size == 37)
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.id3Identifier == "TALB")
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "A New Album")
        #expect(id3Tag?.frames[.artist]?.size == 39)
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.id3Identifier == "TPE1")
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "A New Artist")
    }

    @Test func testReadTagV4WithImage() throws {
        let id3TagEditor = ID3TagEditor()
        let path = PathLoader().pathFor(name: "cover-v4", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))

        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v4-png", fileType: "mp3"))

        #expect(id3Tag?.properties.version == .version4)
        #expect(id3Tag?.frames[.artist]?.id3Identifier == "TPE1")
        #expect(id3Tag?.frames[.artist]?.size == 19)
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "MATRANG")
        #expect(id3Tag?.frames[.title]?.id3Identifier == "TIT2")
        #expect(id3Tag?.frames[.title]?.size == 24)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "Медуза")
        #expect(id3Tag?.frames[.genre]?.id3Identifier == "TCON")
        #expect(id3Tag?.frames[.genre]?.size == 19)
        #expect(id3Tag?.frames[.genre] as? ID3FrameGenre == ID3FrameGenre(genre: nil, description: "Hip-Hop"))
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == cover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .png)
    }

    @Test func testReadAsMp3() throws {
        let id3TagEditor = ID3TagEditor()
        let path = PathLoader().pathFor(name: "example-cover-png", fileType: "png")
        let cover = try Data(contentsOf: URL(fileURLWithPath: path))
        let mp3 = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v23", fileType: "mp3"))
        )

        let id3Tag = try id3TagEditor.read(mp3: mp3)

        #expect(id3Tag?.properties.version == .version3)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "A title")
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "An album")
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "An artist")
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == cover)
        #expect((id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .png)
    }

    @Test func testReadCorruptedFile() throws {
        let id3TagEditor = ID3TagEditor()
        let mp3 = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-corrupted", fileType: "mp3"))
        )

        #expect(throws: ID3TagEditorError.corruptedFile.self) {
            try id3TagEditor.read(mp3: mp3)
        }
    }
    
    @Test func testReadTagInvalidFrameSize() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example-v3-invalid-frame-size", fileType: "mp3"))

        #expect(id3Tag?.properties.version == .version3)
        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "A New title")
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "A New Album")
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "A New Artist")
    }


    @Test func testReadUtf16String() throws {
        let id3TagEditor = ID3TagEditor()
        let pathMp3 = PathLoader().pathFor(name: "example-utf16", fileType: "mp3")

        let id3Tag = try id3TagEditor.read(from: pathMp3)

        #expect((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content == "Om Tryumbacom")
        #expect((id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content == "Laraaji")
        #expect((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content == "Vision Songs Vol. 1")
        #expect((id3Tag?.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value == 2018)
        #expect((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part == 10)
    }

    @Test func testReadNewFramesV2() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(
            from: PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        )

        #expect(id3Tag?.properties.version == .version2)
        #expect(id3Tag?.frames[.composer]?.id3Identifier == "TCM")
        #expect((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content == "Composer V2")
        #expect(id3Tag?.frames[.conductor]?.id3Identifier == "TP3")
        #expect((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "Conductor V2")
        #expect(id3Tag?.frames[.contentGrouping]?.id3Identifier == "TT1")
        #expect((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V2")
        #expect(id3Tag?.frames[.copyright]?.id3Identifier == "TCR")
        #expect((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V2")
        #expect(id3Tag?.frames[.encodedBy]?.id3Identifier == "TEN")
        #expect((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V2")
        #expect(id3Tag?.frames[.encoderSettings]?.id3Identifier == "TSS")
        #expect((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V2")
        #expect(id3Tag?.frames[.lyricist]?.id3Identifier == "TXT")
        #expect((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V2")
        #expect(id3Tag?.frames[.mixArtist]?.id3Identifier == "TP4")
        #expect((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V2")
        #expect(id3Tag?.frames[.publisher]?.id3Identifier == "TPB")
        #expect((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V2")
        #expect(id3Tag?.frames[.subtitle]?.id3Identifier == "TT3")
        #expect((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V2")
        #expect(id3Tag?.frames[.discPosition]?.id3Identifier == "TPA")
        #expect((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
    }

    @Test func testReadNewFramesV3() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(
            from: PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        )

        #expect(id3Tag?.properties.version == .version3)
        #expect(id3Tag?.frames[.composer]?.id3Identifier == "TCOM")
        #expect((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content == "Composer V3")
        #expect(id3Tag?.frames[.conductor]?.id3Identifier == "TPE3")
        #expect((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "Conductor V3")
        #expect(id3Tag?.frames[.copyright]?.id3Identifier == "TCOP")
        #expect((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V3")
        #expect(id3Tag?.frames[.contentGrouping]?.id3Identifier == "TIT1")
        #expect((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V3")
        #expect(id3Tag?.frames[.discPosition]?.id3Identifier == "TPOS")
        #expect((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((id3Tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
        #expect(id3Tag?.frames[.encodedBy]?.id3Identifier == "TENC")
        #expect((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V3")
        #expect(id3Tag?.frames[.encoderSettings]?.id3Identifier == "TSSE")
        #expect((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V3")
        #expect(id3Tag?.frames[.iTunesGrouping]?.id3Identifier == "GRP1")
        #expect((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content == "ItunesGrouping V3")
        #expect(id3Tag?.frames[.lyricist]?.id3Identifier == "TEXT")
        #expect((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V3")
        #expect(id3Tag?.frames[.mixArtist]?.id3Identifier == "TPE4")
        #expect((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V3")
        #expect(id3Tag?.frames[.fileOwner]?.id3Identifier == "TOWN")
        #expect((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content == "FileOwner V3")
        #expect(id3Tag?.frames[.iTunesMovementName]?.id3Identifier == "MVNM")
        #expect((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content == "MovementName V3")
        #expect(id3Tag?.frames[.iTunesMovementIndex]?.id3Identifier == "MVIN")
        #expect((id3Tag?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value == 6)
        #expect((id3Tag?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value == 13)
        #expect(id3Tag?.frames[.iTunesPodcastCategory]?.id3Identifier == "TCAT")
        #expect(
            (id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content ==
            "PodcastCategory V3"
        )
        #expect(id3Tag?.frames[.iTunesPodcastDescription]?.id3Identifier == "TDES")
        #expect(
            (id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content ==
            "PodcastDescription V3"
        )
        #expect(id3Tag?.frames[.iTunesPodcastID]?.id3Identifier == "TGID")
        #expect((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content == "PodcastID V3")
        #expect(id3Tag?.frames[.iTunesPodcastKeywords]?.id3Identifier == "TKWD")
        #expect(
            (id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content ==
            "PodcastKeywords V3"
        )
        #expect(id3Tag?.frames[.publisher]?.id3Identifier == "TPUB")
        #expect((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V3")
        #expect(id3Tag?.frames[.subtitle]?.id3Identifier == "TIT3")
        #expect((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V3")
    }

    @Test func testReadNewFramesV4() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(
            from: PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        )

        #expect(id3Tag?.properties.version == .version4)
        #expect((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.id3Identifier == "TCOM")
        #expect((id3Tag?.frames[.composer] as? ID3FrameWithStringContent)?.content == "Composer V4")
        #expect((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.id3Identifier == "TPE3")
        #expect((id3Tag?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "Conductor V4")
        #expect((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.id3Identifier == "TCOP")
        #expect((id3Tag?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V4")
        #expect((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.id3Identifier == "TIT1")
        #expect((id3Tag?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V4")
        #expect((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.id3Identifier == "TENC")
        #expect((id3Tag?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V4")
        #expect((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.id3Identifier == "TSSE")
        #expect((id3Tag?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V4")
        #expect((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.id3Identifier == "TOWN")
        #expect((id3Tag?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content == "FileOwner V4")
        #expect((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier == "GRP1")
        #expect((id3Tag?.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content == "ItunesGrouping V4")
        #expect((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.id3Identifier == "TEXT")
        #expect((id3Tag?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V4")
        #expect((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.id3Identifier == "TPE4")
        #expect((id3Tag?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V4")
        #expect((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.id3Identifier == "MVNM")
        #expect((id3Tag?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content == "MovementName V4")
        #expect((id3Tag?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value == 6)
        #expect((id3Tag?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value == 13)
        #expect((id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.id3Identifier == "TCAT")
        #expect(
            (id3Tag?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content ==
            "PodcastCategory V4"
        )
        #expect((id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.id3Identifier == "TDES")
        #expect(
            (id3Tag?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content ==
            "PodcastDescription V4"
        )
        #expect((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.id3Identifier == "TGID")
        #expect((id3Tag?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content == "PodcastID V4")
        #expect((id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.id3Identifier == "TKWD")
        #expect(
            (id3Tag?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content ==
            "PodcastKeywords V4"
        )
        #expect((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.id3Identifier == "TPUB")
        #expect((id3Tag?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V4")
        #expect((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.id3Identifier == "TIT3")
        #expect((id3Tag?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V4")
    }

    // MARK: write

    @Test func testWriteTagV2() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }
        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteTagV3WhenItAlreadyExists() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-with-tag-already-setted", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteTagV3WithJpg() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteTagV3WithPng() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: NSHomeDirectory() + "/example-v3-png.mp3"
            )
        }
    }

    @Test func testWriteTagV3WithCustomPathThatDoesNotExists() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }
    }

    @Test func testWriteTagV3WithSamePath() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified-in-same-path", fileType: "mp3")
            )
        }
    }

    @Test func testWriteTagV3WithAdditionalData() throws {
        let id3TagEditor = ID3TagEditor()
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
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront,
                                                                       type: .frontCover,
                                                                       format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack,
                                                                      type: .backCover,
                                                                      format: .jpeg),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingYear: ID3FrameWithIntegerContent(value: 2018),
                .recordingDayMonth: ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
        )

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: NSHomeDirectory() + "/example-v3-additional-data.mp3"
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteTagV3ToMp3AsData() throws {
        let id3TagEditor = ID3TagEditor()
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
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront,
                                                                       type: .frontCover,
                                                                       format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack,
                                                                      type: .backCover,
                                                                      format: .jpeg),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingYear: ID3FrameWithIntegerContent(value: 2018),
                .recordingDayMonth: ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39)
            ]
        )
        let mp3 = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                                  fileType: "mp3")))

        let newMp3 = try id3TagEditor.write(tag: id3Tag, mp3: mp3)

        #expect(
            newMp3 ==
            (try? Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-v3-additional-data",
                                                                            fileType: "mp3"))))
        )
    }

    @Test func testWriteTagV4() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteTagV4WithPng() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteNewFramesV2() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteNewFramesV3() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }
        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testWriteNewFramesV4() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        #expect(
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))) ==
            (try? Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare)))
        )
    }

    @Test func testFramesAfterAttachdPicturesAreWritten() throws {
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "frames-after-attached-picture", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        let tag = try id3TagEditor.read(from: pathMp3Generated)
        #expect((tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((tag?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
    }

    @Test func testWriteTagV4SynchsafeIntegers() throws {
        let id3TagEditor = ID3TagEditor()
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

        #expect(throws: Never.self) {
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example-to-be-modified", fileType: "mp3"),
                andSaveTo: pathMp3Generated
            )
        }

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)

        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == art)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .png)
        #expect(
            (id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type ==
            .frontCover
        )
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.size == 243723)
    }

    @Test func testWriteUnsynchronisedLyrics() throws {
        let id3TagEditor = ID3TagEditor()
        let pathMp3Generated = NSHomeDirectory() + "/example-write-unsynched-lyrics-v3.mp3"

        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .unsynchronizedLyrics(.ita): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita,
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

        #expect(
            (id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.language ==
            .ita
        )
        #expect(
            (id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription ==
            "CD"
        )
        #expect(
            (id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)!.content ==
            """
                        Lyrics
                        Multiline
                        Oh yeah!!
                    """)
    }

    @Test func testCommentWithUTF8EncodingAndNoContentDescription() throws {
        let id3TagEditor = ID3TagEditor()
        let id3Tag = try id3TagEditor.read(
            from: PathLoader().pathFor(name: "example-comment-utf8-no-contentdescription", fileType: "mp3")
        )

        #expect((id3Tag?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3Tag?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "")
        #expect((id3Tag?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.content == "ÜberStandard - UberNet.org")
    }
}

// swiftlint:enable type_body_length
// swiftlint:enable function_body_length
// swiftlint:enable line_length
// swiftlint:enable file_length
