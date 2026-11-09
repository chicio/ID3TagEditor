//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameConfiguration {
    private typealias Identifiers = [FrameType: [UInt8]]
    private typealias NamesForIdentifiers = [UInt32: FrameType]
    private let commonFourLetterIdentifiers: Identifiers = [
        .artist: [UInt8]("TPE1".utf8),
        .composer: [UInt8]("TCOM".utf8),
        .conductor: [UInt8]("TPE3".utf8),
        .contentGrouping: [UInt8]("TIT1".utf8),
        .copyright: [UInt8]("TCOP".utf8),
        .encodedBy: [UInt8]("TENC".utf8),
        .encoderSettings: [UInt8]("TSSE".utf8),
        .fileOwner: [UInt8]("TOWN".utf8),
        .iTunesGrouping: [UInt8]("GRP1".utf8),
        .lyricist: [UInt8]("TEXT".utf8),
        .mixArtist: [UInt8]("TPE4".utf8),
        .publisher: [UInt8]("TPUB".utf8),
        .subtitle: [UInt8]("TIT3".utf8),
        .albumArtist: [UInt8]("TPE2".utf8),
        .title: [UInt8]("TIT2".utf8),
        .album: [UInt8]("TALB".utf8),
        .attachedPicture: [UInt8]("APIC".utf8),
        .genre: [UInt8]("TCON".utf8),
        .trackPosition: [UInt8]("TRCK".utf8),
        .initialKey: [UInt8]("TKEY".utf8),
        .discPosition: [UInt8]("TPOS".utf8),
        .beatsPerMinute: [UInt8]("TBPM".utf8),
        .originalFilename: [UInt8]("TOFN".utf8),
        .lengthInMilliseconds: [UInt8]("TLEN".utf8),
        .unsyncronisedLyrics: [UInt8]("USLT".utf8),
        .comment: [UInt8]("COMM".utf8),
        .iTunesMovementName: [UInt8]("MVNM".utf8),
        .iTunesMovementIndex: [UInt8]("MVIN".utf8),
        .iTunesMovementCount: [UInt8]("MVCN".utf8),
        .iTunesPodcastCategory: [UInt8]("TCAT".utf8),
        .iTunesPodcastDescription: [UInt8]("TDES".utf8),
        .iTunesPodcastID: [UInt8]("TGID".utf8),
        .iTunesPodcastKeywords: [UInt8]("TKWD".utf8)
    ]
    private let identifiersVersion2: Identifiers = [
        .artist: [UInt8]("TP1".utf8),
        .composer: [UInt8]("TCM".utf8),
        .conductor: [UInt8]("TP3".utf8),
        .contentGrouping: [UInt8]("TT1".utf8),
        .copyright: [UInt8]("TCR".utf8),
        .encodedBy: [UInt8]("TEN".utf8),
        .encoderSettings: [UInt8]("TSS".utf8),
        .lyricist: [UInt8]("TXT".utf8),
        .mixArtist: [UInt8]("TP4".utf8),
        .publisher: [UInt8]("TPB".utf8),
        .subtitle: [UInt8]("TT3".utf8),
        .albumArtist: [UInt8]("TP2".utf8),
        .title: [UInt8]("TT2".utf8),
        .album: [UInt8]("TAL".utf8),
        .attachedPicture: [UInt8]("PIC".utf8),
        .recordingDayMonth: [UInt8]("TDA".utf8),
        .recordingYear: [UInt8]("TYE".utf8),
        .recordingHourMinute: [UInt8]("TIM".utf8),
        .genre: [UInt8]("TCO".utf8),
        .trackPosition: [UInt8]("TRK".utf8),
        .initialKey: [UInt8]("TKE".utf8),
        .discPosition: [UInt8]("TPA".utf8),
        .beatsPerMinute: [UInt8]("TBP".utf8),
        .originalFilename: [UInt8]("TOF".utf8),
        .lengthInMilliseconds: [UInt8]("TLE".utf8),
        .sizeInBytes: [UInt8]("TSI".utf8),
        .unsyncronisedLyrics: [UInt8]("ULT".utf8),
        .comment: [UInt8]("COM".utf8)
    ]
    private let identifiersVersion3: Identifiers
    private let identifiersVersion3Init: Identifiers = [
        .recordingDayMonth: [UInt8]("TDAT".utf8),
        .recordingYear: [UInt8]("TYER".utf8),
        .recordingHourMinute: [UInt8]("TIME".utf8),
        .sizeInBytes: [UInt8]("TSIZ".utf8)
    ]
    private let identifiersVersion4: Identifiers
    private let identifiersVersion4Init: Identifiers = [
        .recordingDateTime: [UInt8]("TDRC".utf8)
    ]
    private let commonNamesForIdentifiers: NamesForIdentifiers = [
        "TPE1".uint32: .artist,
        "TCOM".uint32: .composer,
        "TPE3".uint32: .conductor,
        "TIT1".uint32: .contentGrouping,
        "TCOP".uint32: .copyright,
        "TENC".uint32: .encodedBy,
        "TSSE".uint32: .encoderSettings,
        "TOWN".uint32: .fileOwner,
        "GRP1".uint32: .iTunesGrouping,
        "TEXT".uint32: .lyricist,
        "TPE4".uint32: .mixArtist,
        "TPUB".uint32: .publisher,
        "TIT3".uint32: .subtitle,
        "TPE2".uint32: .albumArtist,
        "TIT2".uint32: .title,
        "TALB".uint32: .album,
        "APIC".uint32: .attachedPicture,
        "TCON".uint32: .genre,
        "TRCK".uint32: .trackPosition,
        "TPOS".uint32: .discPosition,
        "MVNM".uint32: .iTunesMovementName,
        "MVIN".uint32: .iTunesMovementIndex,
        "MVCN".uint32: .iTunesMovementCount,
        "TCAT".uint32: .iTunesPodcastCategory,
        "TDES".uint32: .iTunesPodcastDescription,
        "TGID".uint32: .iTunesPodcastID,
        "TKWD".uint32: .iTunesPodcastKeywords,
        "USLT".uint32: .unsyncronisedLyrics,
        "COMM".uint32: .comment,
        "TBPM".uint32: .beatsPerMinute,
        "TOFN".uint32: .originalFilename,
        "TLEN".uint32: .lengthInMilliseconds,
        "TKEY".uint32: .initialKey
    ]
    private let nameForIdentifierVersion2: NamesForIdentifiers = [
        "TP1".uint32: .artist,
        "TCM".uint32: .composer,
        "TP3".uint32: .conductor,
        "TT1".uint32: .contentGrouping,
        "TCR".uint32: .copyright,
        "TEN".uint32: .encodedBy,
        "TSS".uint32: .encoderSettings,
        "TXT".uint32: .lyricist,
        "TP4".uint32: .mixArtist,
        "TPB".uint32: .publisher,
        "TT3".uint32: .subtitle,
        "TP2".uint32: .albumArtist,
        "TT2".uint32: .title,
        "TAL".uint32: .album,
        "PIC".uint32: .attachedPicture,
        "TDA".uint32: .recordingDayMonth,
        "TYE".uint32: .recordingYear,
        "TIM".uint32: .recordingHourMinute,
        "TCO".uint32: .genre,
        "TRK".uint32: .trackPosition,
        "TPA".uint32: .discPosition,
        "ULT".uint32: .unsyncronisedLyrics,
        "COM".uint32: .comment,
        "TBP".uint32: .beatsPerMinute,
        "TOF".uint32: .originalFilename,
        "TLE".uint32: .lengthInMilliseconds,
        "TSI".uint32: .sizeInBytes,
        "TKE".uint32: .initialKey
    ]
    private let nameForIdentifierVersion3: NamesForIdentifiers
    private let nameForIdentifierVersion3Init: NamesForIdentifiers = [
        "TDAT".uint32: .recordingDayMonth,
        "TYER".uint32: .recordingYear,
        "TIME".uint32: .recordingHourMinute,
        "TSIZ".uint32: .sizeInBytes
    ]
    private let nameForIdentifierVersion4: NamesForIdentifiers
    private let nameForIdentifierVersion4Init: NamesForIdentifiers = [
        "TDRC".uint32: .recordingDateTime
    ]
    private let encodingSizeInBytes: Int = 1

    init() {
        self.identifiersVersion3 = self.identifiersVersion3Init.merging(commonFourLetterIdentifiers) { $1 }
        self.identifiersVersion4 = self.identifiersVersion4Init.merging(commonFourLetterIdentifiers) { $1 }
        self.nameForIdentifierVersion3 = self.nameForIdentifierVersion3Init.merging(commonNamesForIdentifiers) { $1 }
        self.nameForIdentifierVersion4 = self.nameForIdentifierVersion4Init.merging(commonNamesForIdentifiers) { $1 }
    }

    func headerSizeFor(version: ID3Version) -> Int {
        switch version {
        case .version2: 6
        case .version3: 10
        case .version4: 10
        }
    }

    func sizeOffsetFor(version: ID3Version) -> Int {
        switch version {
        case .version2: 2
        case .version3: 4
        case .version4: 4
        }
    }

    func sizeMaskFor(version: ID3Version) -> UInt32 {
        switch version {
        case .version2: 0x00FFFFFF
        case .version3: 0xFFFFFFFF
        case .version4: 0xFFFFFFFF
        }
    }

    func identifierSizeFor(version: ID3Version) -> Int {
        switch version {
        case .version2: 3
        case .version3: 4
        case .version4: 4
        }
    }

    func identifierFor(frameType: FrameType, version: ID3Version) -> [UInt8] {
        let identifiers = switch version {
        case .version2: identifiersVersion2
        case .version3: identifiersVersion3
        case .version4: identifiersVersion4
        }

        return identifiers[frameType]!
    }

    func frameTypeFor(identifierNumeric: UInt32, version: ID3Version) -> FrameType {
        let nameForIdentifier = switch version {
        case .version2: nameForIdentifierVersion2
        case .version3: nameForIdentifierVersion3
        case .version4: nameForIdentifierVersion4
        }

        let frameType = nameForIdentifier[identifierNumeric]
        return frameType ?? .invalid
    }

    func encodingSize() -> Int {
        return encodingSizeInBytes
    }

    func encodingPositionFor(version: ID3Version) -> Int {
        switch version {
        case .version2: 6
        case .version3: 10
        case .version4: 10
        }
    }

    func encodingByteFor(version: ID3Version, encoding: ID3StringEncoding) -> [UInt8] {
        switch (version, encoding) {
        case (.version2, .ISO88591): [0x00]
        case (.version2, .UTF16): [0x01]
        case (.version3, .ISO88591): [0x00]
        case (.version3, .UTF16): [0x01]
        case (.version4, .ISO88591): [0x00]
        case (.version4, .UTF16): [0x01]
        case (.version4, .UTF8): [0x03]
        default: fatalError()
        }
    }
}

fileprivate extension String {
    var uint32: UInt32 {
        let prefix = self.prefix(MemoryLayout<UInt32>.size)
        let bytes = [UInt8](prefix.utf8)
        var value: UInt32 = 0

        // "reversed()" for little-endian.
        for byte in bytes.reversed() {
            value <<= 8
            value |= UInt32(byte)
        }

        return value
    }
}
