//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameConfiguration {
    private let commonFourLetterIdentifiers: [FrameType: [UInt8]] = [
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
    private var identifiers: [ID3Version: [FrameType: [UInt8]]] = [
        .version2: [
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
        ],
        .version3: [
            .recordingDayMonth: [UInt8]("TDAT".utf8),
            .recordingYear: [UInt8]("TYER".utf8),
            .recordingHourMinute: [UInt8]("TIME".utf8),
            .sizeInBytes: [UInt8]("TSIZ".utf8)
        ],
        .version4: [
            .recordingDateTime: [UInt8]("TDRC".utf8)
        ]
    ]
    private let commonNamesForIdentifiers: [String: FrameType] = [
        "TPE1": .artist,
        "TCOM": .composer,
        "TPE3": .conductor,
        "TIT1": .contentGrouping,
        "TCOP": .copyright,
        "TENC": .encodedBy,
        "TSSE": .encoderSettings,
        "TOWN": .fileOwner,
        "GRP1": .iTunesGrouping,
        "TEXT": .lyricist,
        "TPE4": .mixArtist,
        "TPUB": .publisher,
        "TIT3": .subtitle,
        "TPE2": .albumArtist,
        "TIT2": .title,
        "TALB": .album,
        "APIC": .attachedPicture,
        "TCON": .genre,
        "TRCK": .trackPosition,
        "TPOS": .discPosition,
        "MVNM": .iTunesMovementName,
        "MVIN": .iTunesMovementIndex,
        "MVCN": .iTunesMovementCount,
        "TCAT": .iTunesPodcastCategory,
        "TDES": .iTunesPodcastDescription,
        "TGID": .iTunesPodcastID,
        "TKWD": .iTunesPodcastKeywords,
        "USLT": .unsyncronisedLyrics,
        "COMM": .comment,
        "TBPM": .beatsPerMinute,
        "TOFN": .originalFilename,
        "TLEN": .lengthInMilliseconds,
        "TKEY": .initialKey
    ]
    private var nameForIdentifier: [ID3Version: [String: FrameType]] = [
        .version2: [
            "TP1": .artist,
            "TCM": .composer,
            "TP3": .conductor,
            "TT1": .contentGrouping,
            "TCR": .copyright,
            "TEN": .encodedBy,
            "TSS": .encoderSettings,
            "TXT": .lyricist,
            "TP4": .mixArtist,
            "TPB": .publisher,
            "TT3": .subtitle,
            "TP2": .albumArtist,
            "TT2": .title,
            "TAL": .album,
            "PIC": .attachedPicture,
            "TDA": .recordingDayMonth,
            "TYE": .recordingYear,
            "TIM": .recordingHourMinute,
            "TCO": .genre,
            "TRK": .trackPosition,
            "TPA": .discPosition,
            "ULT": .unsyncronisedLyrics,
            "COM": .comment,
            "TBP": .beatsPerMinute,
            "TOF": .originalFilename,
            "TLE": .lengthInMilliseconds,
            "TSI": .sizeInBytes,
            "TKE": .initialKey
        ],
        .version3: [
            "TDAT": .recordingDayMonth,
            "TYER": .recordingYear,
            "TIME": .recordingHourMinute,
            "TSIZ": .sizeInBytes
        ],
        .version4: [
            "TDRC": .recordingDateTime
        ]
    ]
    private let encodingSizeInBytes: Int = 1

    init() {
        self.identifiers[.version3] = self.identifiers[.version3]?.merging(commonFourLetterIdentifiers) { $1 }
        self.identifiers[.version4] = self.identifiers[.version4]?.merging(commonFourLetterIdentifiers) { $1 }
        self.nameForIdentifier[.version3] = self.nameForIdentifier[.version3]?.merging(commonNamesForIdentifiers) { $1 }
        self.nameForIdentifier[.version4] = self.nameForIdentifier[.version4]?.merging(commonNamesForIdentifiers) { $1 }
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
        return identifiers[version]![frameType]!
    }

    func frameTypeFor(identifier: String, version: ID3Version) -> FrameType {
        return nameForIdentifier[version]![identifier] ?? .invalid
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
