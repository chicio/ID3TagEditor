//
//  ID3FrameConfiguration.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameConfiguration {
    private let headerSizesInBytes: [ID3Version : Int] = [
        .version2 : 6,
        .version3 : 10,
        .version4 : 10
    ]
    private let sizeOffsetInBytes: [ID3Version : Int] = [
        .version2 : 2,
        .version3 : 4,
        .version4 : 4
    ]
    private let sizeMask: [ID3Version : UInt32] = [
        .version2 : 0x00FFFFFF,
        .version3 : 0xFFFFFFFF,
        .version4 : 0xFFFFFFFF
    ]
    private let identifierSizeInBytes: [ID3Version : Int] = [
        .version2 : 3,
        .version3 : 4,
        .version4 : 4
    ]
    private let commonFourLetterIdentifiers: [FrameType : [UInt8]] = [
        .Artist : [UInt8]("TPE1".utf8),
        .Composer : [UInt8]("TCOM".utf8),
        .Conductor : [UInt8]("TPE3".utf8),
        .ContentGrouping : [UInt8]("TIT1".utf8),
        .Copyright : [UInt8]("TCOP".utf8),
        .EncodedBy : [UInt8]("TENC".utf8),
        .EncoderSettings : [UInt8]("TSSE".utf8),
        .FileOwner : [UInt8]("TOWN".utf8),
        .FileType : [UInt8]("TFLT".utf8),
        .ITunesGrouping : [UInt8]("GRP1".utf8),
        .Lyricist : [UInt8]("TEXT".utf8),
        .MediaType : [UInt8]("TMED".utf8),
        .MixArtist : [UInt8]("TPE4".utf8),
        .ITunesMovementName : [UInt8]("MVNM".utf8),
        .ITunesMovementIndex : [UInt8]("MVIN".utf8),
        .PodcastCategory : [UInt8]("TCAT".utf8),
        .PodcastDescription : [UInt8]("TDES".utf8),
        .PodcastID : [UInt8]("TGID".utf8),
        .PodcastKeywords : [UInt8]("TKWD".utf8),
        .Publisher : [UInt8]("TPUB".utf8),
        .Subtitle : [UInt8]("TIT3".utf8),
        .UnsyncedLyrics : [UInt8]("USLT".utf8),
        .AlbumArtist : [UInt8]("TPE2".utf8),
        .Title : [UInt8]("TIT2".utf8),
        .Album : [UInt8]("TALB".utf8),
        .AttachedPicture : [UInt8]("APIC".utf8),
        .Genre : [UInt8]("TCON".utf8),
        .TrackPosition : [UInt8]("TRCK".utf8),
        .DiscPosition : [UInt8]("TPOS".utf8),
        .SeriesIndex : [UInt8]("TXXX".utf8)
    ]
    private var identifiers: [ID3Version : [FrameType : [UInt8]]] = [
        .version2 : [
            .Artist : [UInt8]("TP1".utf8),
            .Composer : [UInt8]("TCM".utf8),
            .Conductor : [UInt8]("TP3".utf8),
            .ContentGrouping : [UInt8]("TT1".utf8),
            .Copyright : [UInt8]("TCR".utf8),
            .EncodedBy : [UInt8]("TEN".utf8),
            .EncoderSettings : [UInt8]("TSS".utf8),
            .FileType : [UInt8]("TFT".utf8),
            .Lyricist : [UInt8]("TXT".utf8),
            .MediaType : [UInt8]("TMT".utf8),
            .MixArtist : [UInt8]("TP4".utf8),
            .Publisher : [UInt8]("TPB".utf8),
            .Subtitle : [UInt8]("TT3".utf8),
            .UnsyncedLyrics : [UInt8]("ULT".utf8),
            .AlbumArtist : [UInt8]("TP2".utf8),
            .Title : [UInt8]("TT2".utf8),
            .Album : [UInt8]("TAL".utf8),
            .AttachedPicture : [UInt8]("PIC".utf8),
            .RecordingDayMonth : [UInt8]("TDA".utf8),
            .RecordingYear : [UInt8]("TYE".utf8),
            .RecordingHourMinute : [UInt8]("TIM".utf8),
            .Genre : [UInt8]("TCO".utf8),
            .TrackPosition : [UInt8]("TRK".utf8),
            .DiscPosition : [UInt8]("TPA".utf8),
            .SeriesIndex : [UInt8]("TXX".utf8)
        ],
        .version3 : [
            .RecordingDayMonth : [UInt8]("TDAT".utf8),
            .RecordingYear : [UInt8]("TYER".utf8),
            .RecordingHourMinute : [UInt8]("TIME".utf8)
        ],
        .version4 : [
            .RecordingDateTime : [UInt8]("TDRC".utf8),
        ]
    ]
    private let commonNamesForIdentifiers: [String : FrameType] = [
        "TPE1" : .Artist,
        "TCOM" : .Composer,
        "TPE3" : .Conductor,
        "TIT1" : .ContentGrouping,
        "TCOP" : .Copyright,
        "TENC" : .EncodedBy,
        "TSSE" : .EncoderSettings,
        "TOWN" : .FileOwner,
        "TFLT" : .FileType,
        "GRP1" : .ITunesGrouping,
        "TEXT" : .Lyricist,
        "TMED" : .MediaType,
        "TPE4" : .MixArtist,
        "MVNM" : .ITunesMovementName,
        "MVIN" : .ITunesMovementIndex,
        "TCAT" : .PodcastCategory,
        "TDES" : .PodcastDescription,
        "TGID" : .PodcastID,
        "TKWD" : .PodcastKeywords,
        "TPUB" : .Publisher,
        "TIT3" : .Subtitle,
        "USLT" : .UnsyncedLyrics,
        "TPE2" : .AlbumArtist,
        "TIT2" : .Title,
        "TALB" : .Album,
        "APIC" : .AttachedPicture,
        "TCON" : .Genre,
        "TRCK" : .TrackPosition,
        "TPOS" : .DiscPosition,
        "TXXX" : .SeriesIndex
    ]
    private var nameForIdentifier: [ID3Version : [String : FrameType]] = [
        .version2 : [
            "TP1" : .Artist,
            "TCM" : .Composer,
            "TP3" : .Conductor,
            "TT1" : .ContentGrouping,
            "TCR" : .Copyright,
            "TEN" : .EncodedBy,
            "TSS" : .EncoderSettings,
            "TFT" : .FileType,
            "TXT" : .Lyricist,
            "TMT" : .MediaType,
            "TP4" : .MixArtist,
            "TPB" : .Publisher,
            "TT3" : .Subtitle,
            "ULT" : .UnsyncedLyrics,
            "TP2" : .AlbumArtist,
            "TT2" : .Title,
            "TAL" : .Album,
            "PIC" : .AttachedPicture,
            "TDA" : .RecordingDayMonth,
            "TYE" : .RecordingYear,
            "TIM" : .RecordingHourMinute,
            "TCO" : .Genre,
            "TRK" : .TrackPosition,
            "TPA" : .DiscPosition,
            "TXX" : .SeriesIndex
        ],
        .version3 : [
            "TDAT" : .RecordingDayMonth,
            "TYER" : .RecordingYear,
            "TIME" : .RecordingHourMinute
        ],
        .version4 : [
            "TDRC" : .RecordingDateTime
        ]
    ]
    private let encodingPositionInBytes: [ID3Version : Int] = [
        .version2 : 6,
        .version3 : 10,
        .version4 : 10
    ]
    private let encodingSizeInBytes: Int = 1
    private let encodingByte: [ID3Version : [ID3StringEncoding : [UInt8]]] = [
        .version2 : [
            .ISO88591 : [0x00],
            .UTF16 : [0x01]
        ],
        .version3 : [
            .ISO88591 : [0x00],
            .UTF16 : [0x01]
        ],
        .version4 : [
            .ISO88591 : [0x00],
            .UTF16 : [0x01],
            .UTF8 : [0x03]
        ]
    ]
    
    init() {
        self.identifiers[.version3] = self.identifiers[.version3]?.merging(commonFourLetterIdentifiers) { $1 }
        self.identifiers[.version4] = self.identifiers[.version4]?.merging(commonFourLetterIdentifiers) { $1 }
        self.nameForIdentifier[.version3] = self.nameForIdentifier[.version3]?.merging(commonNamesForIdentifiers) { $1 }
        self.nameForIdentifier[.version4] = self.nameForIdentifier[.version4]?.merging(commonNamesForIdentifiers) { $1 }
    }

    func headerSizeFor(version: ID3Version) -> Int {
        return headerSizesInBytes[version]!
    }

    func sizeOffsetFor(version: ID3Version) -> Int {
        return sizeOffsetInBytes[version]!
    }

    func sizeMaskFor(version: ID3Version) -> UInt32 {
        return sizeMask[version]!
    }

    func identifierSizeFor(version: ID3Version) -> Int {
        return identifierSizeInBytes[version]!
    }

    func identifierFor(frameType: FrameType, version: ID3Version) -> [UInt8] {
        return identifiers[version]![frameType]!
    }

    func frameTypeFor(identifier: String, version: ID3Version) -> FrameType {
        return nameForIdentifier[version]![identifier] ?? .Invalid
    }
    
    func encodingSize() -> Int {
        return encodingSizeInBytes
    }
    
    func encodingPositionFor(version: ID3Version) -> Int {
        return encodingPositionInBytes[version]!
    }

    func encodingByteFor(version: ID3Version, encoding: ID3StringEncoding) -> [UInt8] {
        return encodingByte[version]![encoding]!
    }
}
