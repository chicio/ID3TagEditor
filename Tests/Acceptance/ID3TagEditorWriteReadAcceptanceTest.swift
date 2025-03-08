//
//  ID3TagEditorWriteReadAcceptanceTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 15.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

// swiftlint:disable type_body_length
// swiftlint:disable function_body_length
// swiftlint:disable line_length
// swiftlint:disable file_length

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagEditorWriteReadAcceptanceTest {

    @Test func testReadWritev2() throws {
        let id3TagEditor = ID3TagEditor()
        let filename = "example-write-read-v2"
        let artFront = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )
        let pathMp3Generated = NSHomeDirectory() + "/\(filename).mp3"

        let id3Tag = ID32v2TagBuilder()
            .title(frame: ID3FrameWithStringContent(content: "title V2"))
            .album(frame: ID3FrameWithStringContent(content: "album V2"))
            .albumArtist(frame: ID3FrameWithStringContent(content: "album artist V2"))
            .artist(frame: ID3FrameWithStringContent(content: "artist V2"))
            .composer(frame: ID3FrameWithStringContent(content: "composer V2"))
            .conductor(frame: ID3FrameWithStringContent(content: "conductor V2"))
            .contentGrouping(frame: ID3FrameWithStringContent(content: "ContentGrouping V2"))
            .copyright(frame: ID3FrameWithStringContent(content: "Copyright V2"))
            .encodedBy(frame: ID3FrameWithStringContent(content: "EncodedBy V2"))
            .encoderSettings(frame: ID3FrameWithStringContent(content: "EncoderSettings V2"))
            .lyricist(frame: ID3FrameWithStringContent(content: "Lyricist V2"))
            .mixArtist(frame: ID3FrameWithStringContent(content: "MixArtist V2"))
            .publisher(frame: ID3FrameWithStringContent(content: "Publisher V2"))
            .subtitle(frame: ID3FrameWithStringContent(content: "Subtitle V2"))
            .initialKey(frame: ID3FrameWithStringContent(content: "Cbm"))
            .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
            .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
            .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: 9))
            .recordingDayMonth(frame: ID3FrameRecordingDayMonth(day: 5, month: 8))
            .recordingYear(frame: ID3FrameWithIntegerContent(value: 2020))
            .recordingHourMinute(frame: ID3FrameRecordingHourMinute(hour: 15, minute: 39))
            .beatsPerMinute(frame: ID3FrameWithIntegerContent(value: 50))
            .originalFilename(frame: ID3FrameWithStringContent(content: "filenameV2.mp3"))
            .lengthInMilliseconds(frame: ID3FrameWithIntegerContent(value: 9000))
            .sizeInBytes(frame: ID3FrameWithIntegerContent(value: 1500))
            .attachedPicture(pictureType: .frontCover, frame: ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg))
            .attachedPicture(pictureType: .backCover, frame: ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg))
            .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v2 ita unsync lyrics"))
            .unsynchronisedLyrics(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v2 eng unsync lyrics"))
            .comment(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v2 ita comment"))
            .comment(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v2 eng comment"))
            .build()

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: filename, fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        #expect((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content == "title V2")
        #expect((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content == "album V2")
        #expect((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content == "album artist V2")
        #expect((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content == "artist V2")
        #expect((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content == "composer V2")
        #expect((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "conductor V2")
        #expect((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V2")
        #expect((id3TagWritten?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V2")
        #expect((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V2")
        #expect((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V2")
        #expect((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V2")
        #expect((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V2")
        #expect((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V2")
        #expect((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V2")
        #expect((id3TagWritten?.frames[.beatsPerMinute] as? ID3FrameWithIntegerContent)?.value == 50)
        #expect((id3TagWritten?.frames[.originalFilename] as? ID3FrameWithStringContent)?.content == "filenameV2.mp3")
        #expect((id3TagWritten?.frames[.lengthInMilliseconds] as? ID3FrameWithIntegerContent)?.value == 9000)
        #expect((id3TagWritten?.frames[.sizeInBytes] as? ID3FrameWithIntegerContent)?.value == 1500)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier == .metal)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description == "Metalcore")
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part == 2)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total == 9)
        #expect((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day == 5)
        #expect((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month == 8)
        #expect((id3TagWritten?.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value == 2020)
        #expect((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour == 15)
        #expect((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute == 39)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == artFront)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture == artBack)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type == .backCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)!.content == "v2 ita unsync lyrics")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)!.content == "v2 eng unsync lyrics")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)!.content == "v2 ita comment")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)!.content == "v2 eng comment")
        #expect((id3TagWritten?.frames[.initialKey] as? ID3FrameWithStringContent)?.content == "Cbm")

        let tagReader = ID3TagContentReader(id3Tag: id3TagWritten!)
        #expect(tagReader.title() == "title V2")
        #expect(tagReader.album() == "album V2")
        #expect(tagReader.albumArtist() == "album artist V2")
        #expect(tagReader.artist() == "artist V2")
        #expect(tagReader.composer() == "composer V2")
        #expect(tagReader.conductor() == "conductor V2")
        #expect(tagReader.contentGrouping() == "ContentGrouping V2")
        #expect(tagReader.copyright() == "Copyright V2")
        #expect(tagReader.encodedBy() == "EncodedBy V2")
        #expect(tagReader.encoderSettings() == "EncoderSettings V2")
        #expect(tagReader.lyricist() == "Lyricist V2")
        #expect(tagReader.mixArtist() == "MixArtist V2")
        #expect(tagReader.publisher() == "Publisher V2")
        #expect(tagReader.subtitle() == "Subtitle V2")
        #expect(tagReader.initialKey() == "Cbm")
        #expect(tagReader.beatsPerMinute() == 50)
        #expect(tagReader.originalFilename() == "filenameV2.mp3")
        #expect(tagReader.lengthInMilliseconds() == 9000)
        #expect(tagReader.sizeInBytes() == 1500)
        #expect(tagReader.genre() == Genre(identifier: .metal, description: "Metalcore"))
        #expect(tagReader.discPosition() == PartOfTotal(position: 1, total: 3))
        #expect(tagReader.trackPosition() == PartOfTotal(position: 2, total: 9))
        #expect(tagReader.recordingDayMonth() == DayMonth(day: 5, month: 8))
        #expect(tagReader.recordingYear() == 2020)
        #expect(tagReader.recordingHourMinute() == HourMinute(hour: 15, minute: 39))
        #expect(
            tagReader.attachedPictures() ==
            [
                AttachedPicture(picture: artFront, format: .jpeg, type: .frontCover),
                AttachedPicture(picture: artBack, format: .jpeg, type: .backCover)
            ]
        )
        #expect(
            tagReader.unsynchronizedLyrics() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "v2 eng unsync lyrics"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "v2 ita unsync lyrics")
            ]
        )
        #expect(
            tagReader.comments() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "v2 eng comment"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "v2 ita comment")
            ]
        )
    }

    @Test func testReadWritev3() throws {
        let id3TagEditor = ID3TagEditor()
        let filename = "example-write-read-v3"
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/\(filename).mp3"

        let id3Tag = ID32v3TagBuilder()
            .title(frame: ID3FrameWithStringContent(content: "title V3"))
            .album(frame: ID3FrameWithStringContent(content: "album V3"))
            .albumArtist(frame: ID3FrameWithStringContent(content: "album artist V3"))
            .artist(frame: ID3FrameWithStringContent(content: "artist V3"))
            .composer(frame: ID3FrameWithStringContent(content: "composer V3"))
            .conductor(frame: ID3FrameWithStringContent(content: "conductor V3"))
            .contentGrouping(frame: ID3FrameWithStringContent(content: "ContentGrouping V3"))
            .copyright(frame: ID3FrameWithStringContent(content: "Copyright V3"))
            .encodedBy(frame: ID3FrameWithStringContent(content: "EncodedBy V3"))
            .encoderSettings(frame: ID3FrameWithStringContent(content: "EncoderSettings V3"))
            .fileOwner(frame: ID3FrameWithStringContent(content: "FileOwner V3"))
            .lyricist(frame: ID3FrameWithStringContent(content: "Lyricist V3"))
            .mixArtist(frame: ID3FrameWithStringContent(content: "MixArtist V3"))
            .publisher(frame: ID3FrameWithStringContent(content: "Publisher V3"))
            .subtitle(frame: ID3FrameWithStringContent(content: "Subtitle V3"))
            .beatsPerMinute(frame: ID3FrameWithIntegerContent(value: 50))
            .originalFilename(frame: ID3FrameWithStringContent(content: "filenameV3.mp3"))
            .lengthInMilliseconds(frame: ID3FrameWithIntegerContent(value: 9000))
            .sizeInBytes(frame: ID3FrameWithIntegerContent(value: 1500))
            .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
            .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
            .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: 9))
            .recordingDayMonth(frame: ID3FrameRecordingDayMonth(day: 5, month: 8))
            .recordingYear(frame: ID3FrameWithIntegerContent(value: 2020))
            .recordingHourMinute(frame: ID3FrameRecordingHourMinute(hour: 15, minute: 39))
            .initialKey(frame: ID3FrameWithStringContent(content: "Cbm"))
            .attachedPicture(pictureType: .frontCover, frame: ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg))
            .attachedPicture(pictureType: .backCover, frame: ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg))
            .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"))
            .unsynchronisedLyrics(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"))
            .comment(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng comment"))
            .comment(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita comment"))
            .iTunesGrouping(frame: ID3FrameWithStringContent(content: "ItunesGrouping V3"))
            .iTunesMovementName(frame: ID3FrameWithStringContent(content: "MovementName V3"))
            .iTunesMovementIndex(frame: ID3FrameWithIntegerContent(value: 6))
            .iTunesMovementCount(frame: ID3FrameWithIntegerContent(value: 13))
            .iTunesPodcastCategory(frame: ID3FrameWithStringContent(content: "PodcastCategory V3"))
            .iTunesPodcastDescription(frame: ID3FrameWithStringContent(content: "PodcastDescription V3"))
            .iTunesPodcastID(frame: ID3FrameWithStringContent(content: "PodcastID V3"))
            .iTunesPodcastKeywords(frame: ID3FrameWithStringContent(content: "PodcastKeywords V3"))
            .build()

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: filename, fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        #expect((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content == "title V3")
        #expect((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content == "album V3")
        #expect((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content == "album artist V3")
        #expect((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content == "artist V3")
        #expect((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content == "composer V3")
        #expect((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "conductor V3")
        #expect((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V3")
        #expect((id3TagWritten?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V3")
        #expect((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V3")
        #expect((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V3")
        #expect((id3TagWritten?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content == "FileOwner V3")
        #expect((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V3")
        #expect((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V3")
        #expect((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V3")
        #expect((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V3")
        #expect((id3TagWritten?.frames[.beatsPerMinute] as? ID3FrameWithIntegerContent)?.value == 50)
        #expect((id3TagWritten?.frames[.originalFilename] as? ID3FrameWithStringContent)?.content == "filenameV3.mp3")
        #expect((id3TagWritten?.frames[.initialKey] as? ID3FrameWithStringContent)?.content == "Cbm")
        #expect((id3TagWritten?.frames[.lengthInMilliseconds] as? ID3FrameWithIntegerContent)?.value == 9000)
        #expect((id3TagWritten?.frames[.sizeInBytes] as? ID3FrameWithIntegerContent)?.value == 1500)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier == .metal)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description == "Metalcore")
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part == 2)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total == 9)
        #expect((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.day == 5)
        #expect((id3TagWritten?.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.month == 8)
        #expect((id3TagWritten?.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value == 2020)
        #expect((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.hour == 15)
        #expect((id3TagWritten?.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.minute == 39)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == artFront)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture == artBack)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type == .backCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)!.content == "v3 ita unsync lyrics")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)!.content == "v3 eng unsync lyrics")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)!.content == "v3 ita comment")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)!.content == "v3 eng comment")
        #expect((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content == "MovementName V3")
        #expect((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value == 6)
        #expect((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value == 13)
        #expect((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content == "PodcastCategory V3")
        #expect((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content == "PodcastDescription V3")
        #expect((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content == "PodcastID V3")
        #expect((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content == "PodcastKeywords V3")

        let tagReader = ID3TagContentReader(id3Tag: id3TagWritten!)
        #expect(tagReader.title() == "title V3")
        #expect(tagReader.album() == "album V3")
        #expect(tagReader.albumArtist() == "album artist V3")
        #expect(tagReader.artist() == "artist V3")
        #expect(tagReader.composer() == "composer V3")
        #expect(tagReader.conductor() == "conductor V3")
        #expect(tagReader.contentGrouping() == "ContentGrouping V3")
        #expect(tagReader.copyright() == "Copyright V3")
        #expect(tagReader.encodedBy() == "EncodedBy V3")
        #expect(tagReader.encoderSettings() == "EncoderSettings V3")
        #expect(tagReader.fileOwner() == "FileOwner V3")
        #expect(tagReader.lyricist() == "Lyricist V3")
        #expect(tagReader.mixArtist() == "MixArtist V3")
        #expect(tagReader.publisher() == "Publisher V3")
        #expect(tagReader.subtitle() == "Subtitle V3")
        #expect(tagReader.initialKey() == "Cbm")
        #expect(tagReader.beatsPerMinute() == 50)
        #expect(tagReader.originalFilename() == "filenameV3.mp3")
        #expect(tagReader.lengthInMilliseconds() == 9000)
        #expect(tagReader.sizeInBytes() == 1500)
        #expect(tagReader.genre() == Genre(identifier: .metal, description: "Metalcore"))
        #expect(tagReader.discPosition() == PartOfTotal(position: 1, total: 3))
        #expect(tagReader.trackPosition() == PartOfTotal(position: 2, total: 9))
        #expect(tagReader.recordingDayMonth() == DayMonth(day: 5, month: 8))
        #expect(tagReader.recordingYear() == 2020)
        #expect(tagReader.recordingHourMinute() == HourMinute(hour: 15, minute: 39))
        #expect(
            tagReader.attachedPictures() ==
            [
                AttachedPicture(picture: artFront, format: .jpeg, type: .frontCover),
                AttachedPicture(picture: artBack, format: .jpeg, type: .backCover)
            ]
        )
        #expect(
            tagReader.unsynchronizedLyrics() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "v3 eng unsync lyrics"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "v3 ita unsync lyrics")
            ]
        )
        #expect(
            tagReader.comments() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "v3 eng comment"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "v3 ita comment")
            ]
        )
        #expect(tagReader.iTunesMovementName() == "MovementName V3")
        #expect(tagReader.iTunesMovementIndex() == 6)
        #expect(tagReader.iTunesMovementCount() == 13)
        #expect(tagReader.iTunesPodcastCategory() == "PodcastCategory V3")
        #expect(tagReader.iTunesPodcastDescription() == "PodcastDescription V3")
        #expect(tagReader.iTunesPodcastID() == "PodcastID V3")
        #expect(tagReader.iTunesPodcastKeywords() == "PodcastKeywords V3")
    }

    @Test func testReadWritev4() throws {
        let id3TagEditor = ID3TagEditor()
        let filename = "example-write-read-v4"
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))
        let pathMp3Generated = NSHomeDirectory() + "/\(filename).mp3"

        let id3Tag = ID32v4TagBuilder()
            .title(frame: ID3FrameWithStringContent(content: "title V4"))
            .album(frame: ID3FrameWithStringContent(content: "album V4"))
            .albumArtist(frame: ID3FrameWithStringContent(content: "album artist V4"))
            .artist(frame: ID3FrameWithStringContent(content: "artist V4"))
            .composer(frame: ID3FrameWithStringContent(content: "composer V4"))
            .conductor(frame: ID3FrameWithStringContent(content: "conductor V4"))
            .contentGrouping(frame: ID3FrameWithStringContent(content: "ContentGrouping V4"))
            .copyright(frame: ID3FrameWithStringContent(content: "Copyright V4"))
            .encodedBy(frame: ID3FrameWithStringContent(content: "EncodedBy V4"))
            .encoderSettings(frame: ID3FrameWithStringContent(content: "EncoderSettings V4"))
            .fileOwner(frame: ID3FrameWithStringContent(content: "FileOwner V4"))
            .initialKey(frame: ID3FrameWithStringContent(content: "Cbm"))
            .lyricist(frame: ID3FrameWithStringContent(content: "Lyricist V4"))
            .mixArtist(frame: ID3FrameWithStringContent(content: "MixArtist V4"))
            .publisher(frame: ID3FrameWithStringContent(content: "Publisher V4"))
            .subtitle(frame: ID3FrameWithStringContent(content: "Subtitle V4"))
            .beatsPerMinute(frame: ID3FrameWithIntegerContent(value: 50))
            .originalFilename(frame: ID3FrameWithStringContent(content: "filenameV4.mp3"))
            .lengthInMilliseconds(frame: ID3FrameWithIntegerContent(value: 9000))
            .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
            .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
            .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: 9))
            .recordingDateTime(frame: ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(date: RecordingDate(day: 15, month: 10, year: 2020), time: RecordingTime(hour: 21, minute: 50))))
            .attachedPicture(pictureType: .frontCover, frame: ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg))
            .attachedPicture(pictureType: .backCover, frame: ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg))
            .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "V4 ita unsync lyrics"))
            .unsynchronisedLyrics(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "V4 eng unsync lyrics"))
            .comment(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v4 ita comment"))
            .comment(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v4 eng comment"))
            .iTunesGrouping(frame: ID3FrameWithStringContent(content: "ItunesGrouping V4"))
            .iTunesMovementName(frame: ID3FrameWithStringContent(content: "MovementName V4"))
            .iTunesMovementIndex(frame: ID3FrameWithIntegerContent(value: 6))
            .iTunesMovementCount(frame: ID3FrameWithIntegerContent(value: 13))
            .iTunesPodcastCategory(frame: ID3FrameWithStringContent(content: "PodcastCategory V4"))
            .iTunesPodcastDescription(frame: ID3FrameWithStringContent(content: "PodcastDescription V4"))
            .iTunesPodcastID(frame: ID3FrameWithStringContent(content: "PodcastID V4"))
            .iTunesPodcastKeywords(frame: ID3FrameWithStringContent(content: "PodcastKeywords V4"))
            .build()

        try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: filename, fileType: "mp3"),
            andSaveTo: pathMp3Generated
        )

        let id3TagWritten = try id3TagEditor.read(from: pathMp3Generated)
        #expect((id3TagWritten?.frames[.title] as? ID3FrameWithStringContent)?.content == "title V4")
        #expect((id3TagWritten?.frames[.album] as? ID3FrameWithStringContent)?.content == "album V4")
        #expect((id3TagWritten?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content == "album artist V4")
        #expect((id3TagWritten?.frames[.artist] as? ID3FrameWithStringContent)?.content == "artist V4")
        #expect((id3TagWritten?.frames[.composer] as? ID3FrameWithStringContent)?.content == "composer V4")
        #expect((id3TagWritten?.frames[.conductor] as? ID3FrameWithStringContent)?.content == "conductor V4")
        #expect((id3TagWritten?.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content == "ContentGrouping V4")
        #expect((id3TagWritten?.frames[.copyright] as? ID3FrameWithStringContent)?.content == "Copyright V4")
        #expect((id3TagWritten?.frames[.encodedBy] as? ID3FrameWithStringContent)?.content == "EncodedBy V4")
        #expect((id3TagWritten?.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content == "EncoderSettings V4")
        #expect((id3TagWritten?.frames[.fileOwner] as? ID3FrameWithStringContent)?.content == "FileOwner V4")
        #expect((id3TagWritten?.frames[.initialKey] as? ID3FrameWithStringContent)?.content == "Cbm")
        #expect((id3TagWritten?.frames[.lyricist] as? ID3FrameWithStringContent)?.content == "Lyricist V4")
        #expect((id3TagWritten?.frames[.mixArtist] as? ID3FrameWithStringContent)?.content == "MixArtist V4")
        #expect((id3TagWritten?.frames[.publisher] as? ID3FrameWithStringContent)?.content == "Publisher V4")
        #expect((id3TagWritten?.frames[.subtitle] as? ID3FrameWithStringContent)?.content == "Subtitle V4")
        #expect((id3TagWritten?.frames[.beatsPerMinute] as? ID3FrameWithIntegerContent)?.value == 50)
        #expect((id3TagWritten?.frames[.originalFilename] as? ID3FrameWithStringContent)?.content == "filenameV4.mp3")
        #expect((id3TagWritten?.frames[.lengthInMilliseconds] as? ID3FrameWithIntegerContent)?.value == 9000)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.identifier == .metal)
        #expect((id3TagWritten?.frames[.genre] as? ID3FrameGenre)?.description == "Metalcore")
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.part == 1)
        #expect((id3TagWritten?.frames[.discPosition] as? ID3FramePartOfTotal)?.total == 3)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part == 2)
        #expect((id3TagWritten?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total == 9)
        #expect((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.day == 15)
        #expect((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.month == 10)
        #expect((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year == 2020)
        #expect((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.hour == 21)
        #expect((id3TagWritten?.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.time?.minute == 50)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture == artFront)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type == .frontCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.picture == artBack)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.type == .backCover)
        #expect((id3TagWritten?.frames[.attachedPicture(.backCover)] as? ID3FrameAttachedPicture)?.format == .jpeg)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.ita)] as? ID3FrameWithLocalizedContent)!.content == "V4 ita unsync lyrics")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.unsynchronizedLyrics(.eng)] as? ID3FrameWithLocalizedContent)!.content == "V4 eng unsync lyrics")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.language == .ita)
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.ita)] as? ID3FrameWithLocalizedContent)!.content == "v4 ita comment")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.language == .eng)
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)?.contentDescription == "CD")
        #expect((id3TagWritten?.frames[.comment(.eng)] as? ID3FrameWithLocalizedContent)!.content == "v4 eng comment")
        #expect((id3TagWritten?.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content == "MovementName V4")
        #expect((id3TagWritten?.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value == 6)
        #expect((id3TagWritten?.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value == 13)
        #expect((id3TagWritten?.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content == "PodcastCategory V4")
        #expect((id3TagWritten?.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content == "PodcastDescription V4")
        #expect((id3TagWritten?.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content == "PodcastID V4")
        #expect((id3TagWritten?.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content == "PodcastKeywords V4")

        let tagReader = ID3TagContentReader(id3Tag: id3TagWritten!)
        #expect(tagReader.title() == "title V4")
        #expect(tagReader.album() == "album V4")
        #expect(tagReader.albumArtist() == "album artist V4")
        #expect(tagReader.artist() == "artist V4")
        #expect(tagReader.composer() == "composer V4")
        #expect(tagReader.conductor() == "conductor V4")
        #expect(tagReader.contentGrouping() == "ContentGrouping V4")
        #expect(tagReader.copyright() == "Copyright V4")
        #expect(tagReader.encodedBy() == "EncodedBy V4")
        #expect(tagReader.encoderSettings() == "EncoderSettings V4")
        #expect(tagReader.fileOwner() == "FileOwner V4")
        #expect(tagReader.lyricist() == "Lyricist V4")
        #expect(tagReader.mixArtist() == "MixArtist V4")
        #expect(tagReader.publisher() == "Publisher V4")
        #expect(tagReader.subtitle() == "Subtitle V4")
        #expect(tagReader.initialKey() == "Cbm")
        #expect(tagReader.beatsPerMinute() == 50)
        #expect(tagReader.originalFilename() == "filenameV4.mp3")
        #expect(tagReader.lengthInMilliseconds() == 9000)
        #expect(tagReader.genre() == Genre(identifier: .metal, description: "Metalcore"))
        #expect(tagReader.discPosition() == PartOfTotal(position: 1, total: 3))
        #expect(tagReader.trackPosition() == PartOfTotal(position: 2, total: 9))
        #expect(
            tagReader.recordingDateTime() ==
            DateTime(
                day: 15,
                month: 10,
                year: 2020,
                hour: 21,
                minute: 50
            )
        )
        #expect(
            tagReader.attachedPictures() ==
            [
                AttachedPicture(picture: artFront, format: .jpeg, type: .frontCover),
                AttachedPicture(picture: artBack, format: .jpeg, type: .backCover)
            ]
        )
        #expect(
            tagReader.unsynchronizedLyrics() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "V4 eng unsync lyrics"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "V4 ita unsync lyrics")
            ]
        )
        #expect(
            tagReader.comments() ==
            [
                LocalizedContent(language: .eng, contentDescription: "CD", content: "v4 eng comment"),
                LocalizedContent(language: .ita, contentDescription: "CD", content: "v4 ita comment")
            ]
        )
        #expect(tagReader.iTunesMovementName() == "MovementName V4")
        #expect(tagReader.iTunesMovementIndex() == 6)
        #expect(tagReader.iTunesMovementCount() == 13)
        #expect(tagReader.iTunesPodcastCategory() == "PodcastCategory V4")
        #expect(tagReader.iTunesPodcastDescription() == "PodcastDescription V4")
        #expect(tagReader.iTunesPodcastID() == "PodcastID V4")
        #expect(tagReader.iTunesPodcastKeywords() == "PodcastKeywords V4")
    }
}

// swiftlint:enable type_body_length
// swiftlint:enable function_body_length
// swiftlint:enable line_length
// swiftlint:enable file_length
