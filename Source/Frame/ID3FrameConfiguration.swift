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
        .Album : [UInt8]("TALB".utf8),
        .AlbumArtist : [UInt8]("TPE2".utf8),
        .Arranger : [UInt8]("TPE4".utf8),
        .Artist : [UInt8]("TPE1".utf8),
        .Chapter : [UInt8]("CHAP".utf8),
        .Comment : [UInt8]("COMM".utf8),
        .Composer : [UInt8]("TCOM".utf8),
        .Conductor : [UInt8]("TPE3".utf8),
        .ContentGroup : [UInt8]("TIT1".utf8),
        .Copyright : [UInt8]("TCOP".utf8),
        .DiscPosition : [UInt8]("TPOS".utf8),
        .EncodedBy : [UInt8]("TENC".utf8),
        .EncoderSettings : [UInt8]("TSSE".utf8),
        .FileOwner : [UInt8]("TOWN".utf8),
        .FileType : [UInt8]("TFLT".utf8),
        .Genre : [UInt8]("TCON".utf8),
        .ITunesGrouping : [UInt8]("GRP1".utf8),
        .ITunesMovementCount : [UInt8]("MVCN".utf8),
        .ITunesMovementIndex : [UInt8]("MVIN".utf8),
        .ITunesMovementName : [UInt8]("MVNM".utf8),
        .Language : [UInt8]("TLAN".utf8),
        .Lyricist : [UInt8]("TEXT".utf8),
        .MediaType : [UInt8]("TMED".utf8),
        .PodcastCategory : [UInt8]("TCAT".utf8),
        .PodcastDescription : [UInt8]("TDES".utf8),
        .PodcastID : [UInt8]("TGID".utf8),
        .PodcastKeywords : [UInt8]("TKWD".utf8),
        .Publisher : [UInt8]("TPUB".utf8),
        .Subtitle : [UInt8]("TIT3".utf8),
        .TableOfContents : [UInt8]("CTOC".utf8),
        .Title : [UInt8]("TIT2".utf8),
        .TrackPosition : [UInt8]("TRCK".utf8),
        .UnsyncedLyrics : [UInt8]("USLT".utf8),
        .UserDefinedTextInformation : [UInt8]("TXXX".utf8),
        .AttachedPicture : [UInt8]("APIC".utf8),
    ]
    private var identifiers: [ID3Version : [FrameType : [UInt8]]] = [
        .version2 : [
            .Album : [UInt8]("TAL".utf8),
            .AlbumArtist : [UInt8]("TP2".utf8),
            .Arranger : [UInt8]("TP4".utf8),
            .Artist : [UInt8]("TP1".utf8),
            .Comment : [UInt8]("COM".utf8),
            .Composer : [UInt8]("TCM".utf8),
            .Conductor : [UInt8]("TP3".utf8),
            .ContentGroup : [UInt8]("TT1".utf8),
            .Copyright : [UInt8]("TCR".utf8),
            .DiscPosition : [UInt8]("TPA".utf8),
            .EncodedBy : [UInt8]("TEN".utf8),
            .EncoderSettings : [UInt8]("TSS".utf8),
            .FileType : [UInt8]("TFT".utf8),
            .Genre : [UInt8]("TCO".utf8),
            .Language : [UInt8]("TLA".utf8),
            .Lyricist : [UInt8]("TXT".utf8),
            .MediaType : [UInt8]("TMT".utf8),
            .Publisher : [UInt8]("TPB".utf8),
            .Subtitle : [UInt8]("TT3".utf8),
            .Title : [UInt8]("TT2".utf8),
            .TrackPosition : [UInt8]("TRK".utf8),
            .UnsyncedLyrics : [UInt8]("ULT".utf8),
            .UserDefinedTextInformation : [UInt8]("TXX".utf8),
            .AttachedPicture : [UInt8]("PIC".utf8),
            .RecordingDayMonth : [UInt8]("TDA".utf8),
            .RecordingYear : [UInt8]("TYE".utf8),
            .RecordingHourMinute : [UInt8]("TIM".utf8),
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
        "TALB" : .Album,
        "TPE2" : .AlbumArtist,
        "TPE4" : .Arranger,
        "TPE1" : .Artist,
        "CHAP" : .Chapter
        "COMM" : .Comment,
        "TCOM" : .Composer,
        "TPE3" : .Conductor,
        "TIT1" : .ContentGroup,
        "TCOP" : .Copyright,
        "TPOS" : .DiscPosition,
        "TENC" : .EncodedBy,
        "TSSE" : .EncoderSettings,
        "TOWN" : .FileOwner,
        "TFLT" : .FileType,
        "TCON" : .Genre,
        "GRP1" : .ITunesGrouping,
        "MVCN" : .ITunesMovementCount,
        "MVIN" : .ITunesMovementIndex,
        "MVNM" : .ITunesMovementName,
        "TLAN" : .Language,
        "TEXT" : .Lyricist,
        "TMED" : .MediaType,
        "TCAT" : .PodcastCategory,
        "TDES" : .PodcastDescription,
        "TGID" : .PodcastID,
        "TKWD" : .PodcastKeywords,
        "TPUB" : .Publisher,
        "TIT3" : .Subtitle,
        "CTOC" : .TableOfContents,
        "TIT2" : .Title,
        "TRCK" : .TrackPosition,
        "USLT" : .UnsyncedLyrics,
        "TXXX" : .UserDefinedTextInformation,
        "APIC" : .AttachedPicture,
    ]
    private var nameForIdentifier: [ID3Version : [String : FrameType]] = [
        .version2 : [
            "TAL" : .Album,
            "TP2" : .AlbumArtist,
            "TP4" : .Arranger,
            "TP1" : .Artist,
            "COM" : .Comment,
            "TCM" : .Composer,
            "TP3" : .Conductor,
            "TT1" : .ContentGroup,
            "TCR" : .Copyright,
            "TPA" : .DiscPosition,
            "TEN" : .EncodedBy,
            "TSS" : .EncoderSettings,
            "TFT" : .FileType,
            "TCO" : .Genre,
            "TLA" : .Language,
            "TXT" : .Lyricist,
            "TMT" : .MediaType,
            "TPB" : .Publisher,
            "TT3" : .Subtitle,
            "TT2" : .Title,
            "TRK" : .TrackPosition,
            "ULT" : .UnsyncedLyrics,
            "TXX" : .UserDefinedTextInformation,
            "PIC" : .AttachedPicture,
            "TDA" : .RecordingDayMonth,
            "TYE" : .RecordingYear,
            "TIM" : .RecordingHourMinute,
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
        return [encoding.rawValue]
    }
}
