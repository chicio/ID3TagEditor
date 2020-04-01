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
        .ArtistUrl : [UInt8]("WOAR".utf8),
        .AudioSourceUrl : [UInt8]("WOAS".utf8),
        .BPM : [UInt8]("TBPM".utf8),
        //.Chapter : [UInt8]("CHAP".utf8),
        .Comment : [UInt8]("COMM".utf8),
        .ITunesCompilation : [UInt8]("TCMP".utf8),
        .Composer : [UInt8]("TCOM".utf8),
        .Conductor : [UInt8]("TPE3".utf8),
        .ContentGroup : [UInt8]("TIT1".utf8),
        .Copyright : [UInt8]("TCOP".utf8),
        .CopyrightUrl : [UInt8]("WCOP".utf8),
        .DiscPosition : [UInt8]("TPOS".utf8),
        .EncodedBy : [UInt8]("TENC".utf8),
        .EncoderSettings : [UInt8]("TSSE".utf8),
        .FileOwner : [UInt8]("TOWN".utf8),
        .FileType : [UInt8]("TFLT".utf8),
        .AudioFileUrl : [UInt8]("WOAF".utf8),
        .Genre : [UInt8]("TCON".utf8),
        .InitialKey : [UInt8]("TKEY".utf8),
        .ISRC : [UInt8]("TSRC".utf8),
        .ITunesGrouping : [UInt8]("GRP1".utf8),
        .ITunesMovementCount : [UInt8]("MVCN".utf8),
        .ITunesMovementIndex : [UInt8]("MVIN".utf8),
        .ITunesMovementName : [UInt8]("MVNM".utf8),
        .Language : [UInt8]("TLAN".utf8),
        .Length : [UInt8]("TLEN".utf8),
        .Lyricist : [UInt8]("TEXT".utf8),
        .MediaType : [UInt8]("TMED".utf8),
        .OriginalAlbum : [UInt8]("TOAL".utf8),
        .OriginalArtist : [UInt8]("TOPE".utf8),
        .OriginalFilename : [UInt8]("TOFN".utf8),
        .OriginalLyricist : [UInt8]("TOLY".utf8),
        .PlaylistDelay : [UInt8]("TDLY".utf8),
        .Podcast : [UInt8]("PCST".utf8),
        .PodcastCategory : [UInt8]("TCAT".utf8),
        .PodcastDescription : [UInt8]("TDES".utf8),
        .PodcastID : [UInt8]("TGID".utf8),
        .PodcastKeywords : [UInt8]("TKWD".utf8),
        .PodcastUrl : [UInt8]("WFED".utf8),
        //.ProducedNotice : [UInt8]("TPRO".utf8),
        .Publisher : [UInt8]("TPUB".utf8),
        .PublisherUrl : [UInt8]("WPUB".utf8),
        .RadioStation : [UInt8]("TRSN".utf8),
        .RadioStationOwner : [UInt8]("TRSO".utf8),
        .RadioStationUrl : [UInt8]("WORS".utf8),
        .SortAlbum : [UInt8]("TSOA".utf8),
        .SortAlbumArtist : [UInt8]("TSO2".utf8),
        .SortArtist : [UInt8]("TSOP".utf8),
        .SortComposer : [UInt8]("TSOC".utf8),
        .SortTitle : [UInt8]("TSOT".utf8),
        .Subtitle : [UInt8]("TIT3".utf8),
        //.TableOfContents : [UInt8]("CTOC".utf8),
        .Title : [UInt8]("TIT2".utf8),
        .TrackPosition : [UInt8]("TRCK".utf8),
        .UnsyncedLyrics : [UInt8]("USLT".utf8),
        .UserDefinedTextInformation : [UInt8]("TXXX".utf8),
        .UserDefinedUrl : [UInt8]("WXXX".utf8),
        .AttachedPicture : [UInt8]("APIC".utf8),
    ]
    private var identifiers: [ID3Version : [FrameType : [UInt8]]] = [
        .version2 : [
            .Album : [UInt8]("TAL".utf8),
            .AlbumArtist : [UInt8]("TP2".utf8),
            .Arranger : [UInt8]("TP4".utf8),
            .Artist : [UInt8]("TP1".utf8),
            .ArtistUrl : [UInt8]("WAR".utf8),
            .AudioSourceUrl : [UInt8]("WAS".utf8),
            .BPM : [UInt8]("TBP".utf8),
            .Comment : [UInt8]("COM".utf8),
            .Composer : [UInt8]("TCM".utf8),
            .Conductor : [UInt8]("TP3".utf8),
            .ContentGroup : [UInt8]("TT1".utf8),
            .Copyright : [UInt8]("TCR".utf8),
            .CopyrightUrl : [UInt8]("WCP".utf8),
            .DiscPosition : [UInt8]("TPA".utf8),
            .EncodedBy : [UInt8]("TEN".utf8),
            .EncoderSettings : [UInt8]("TSS".utf8),
            .FileType : [UInt8]("TFT".utf8),
            .AudioFileUrl : [UInt8]("WAF".utf8),
            .Genre : [UInt8]("TCO".utf8),
            .InitialKey : [UInt8]("TKE".utf8),
            //.InvolvedPeople : [UInt8]("IPL".utf8),
            .ISRC : [UInt8]("TRC".utf8),
            .Language : [UInt8]("TLA".utf8),
            .Length : [UInt8]("TLE".utf8),
            .Lyricist : [UInt8]("TXT".utf8),
            .MediaType : [UInt8]("TMT".utf8),
            .OriginalAlbum : [UInt8]("TOT".utf8),
            .OriginalArtist : [UInt8]("TOA".utf8),
            .OriginalFilename : [UInt8]("TOF".utf8),
            .OriginalLyricist : [UInt8]("TOL".utf8),
            //.OriginalYear : [UInt8]("TOR".utf8),
            .PlaylistDelay : [UInt8]("TDY".utf8),
            .Publisher : [UInt8]("TPB".utf8),
            .PublisherUrl : [UInt8]("WPB".utf8),
            .Subtitle : [UInt8]("TT3".utf8),
            .Title : [UInt8]("TT2".utf8),
            .TrackPosition : [UInt8]("TRK".utf8),
            .UnsyncedLyrics : [UInt8]("ULT".utf8),
            .UserDefinedTextInformation : [UInt8]("TXX".utf8),
            .UserDefinedUrl : [UInt8]("WXX".utf8),
            .AttachedPicture : [UInt8]("PIC".utf8),
            .RecordingDayMonth : [UInt8]("TDA".utf8),
            .RecordingYear : [UInt8]("TYE".utf8),
            .RecordingHourMinute : [UInt8]("TIM".utf8),
        ],
        .version3 : [
            //.InvolvedPeople : [UInt8]("IPLS".utf8),
            //.OriginalYear : [UInt8]("TORY".utf8),
            .RecordingDayMonth : [UInt8]("TDAT".utf8),
            .RecordingYear : [UInt8]("TYER".utf8),
            .RecordingHourMinute : [UInt8]("TIME".utf8)
        ],
        .version4 : [
            //.InvolvedPeople : [UInt8]("TIPL".utf8),
            .Mood : [UInt8]("TMOO".utf8),
            //.MusicianCredits : [UInt8]("TMCL".utf8),
            //.OriginalYear : [UInt8]("TDOR".utf8),
            .RecordingDateTime : [UInt8]("TDRC".utf8),
            .SetSubtitle : [UInt8]("TSST".utf8),
            .SortPerformer : [UInt8]("TSOP".utf8),
        ]
    ]
    private let commonNamesForIdentifiers: [String : FrameType] = [
        "TALB" : .Album,
        "TPE2" : .AlbumArtist,
        "TPE4" : .Arranger,
        "TPE1" : .Artist,
        "WOAR" : .ArtistUrl,
        "WOAS" : .AudioSourceUrl,
        "TBPM" : .BPM,
        //"CHAP" : .Chapter,
        "COMM" : .Comment,
        "TCMP" : .ITunesCompilation,
        "TCOM" : .Composer,
        "TPE3" : .Conductor,
        "TIT1" : .ContentGroup,
        "TCOP" : .Copyright,
        "WCOP" : .CopyrightUrl,
        "TPOS" : .DiscPosition,
        "TENC" : .EncodedBy,
        "TSSE" : .EncoderSettings,
        "TOWN" : .FileOwner,
        "TFLT" : .FileType,
        "WOAF" : .AudioFileUrl,
        "TKEY" : .InitialKey,
        "TCON" : .Genre,
        "TSRC" : .ISRC,
        "GRP1" : .ITunesGrouping,
        "MVCN" : .ITunesMovementCount,
        "MVIN" : .ITunesMovementIndex,
        "MVNM" : .ITunesMovementName,
        "TLAN" : .Language,
        "TLEN" : .Length,
        "TEXT" : .Lyricist,
        "TMED" : .MediaType,
        "TOAL" : .OriginalAlbum,
        "TOPE" : .OriginalArtist,
        "TOFN" : .OriginalFilename,
        "TOLY" : .OriginalLyricist,
        "TDLY" : .PlaylistDelay,
        "PCST" : .Podcast,
        "TCAT" : .PodcastCategory,
        "TDES" : .PodcastDescription,
        "TGID" : .PodcastID,
        "TKWD" : .PodcastKeywords,
        "WFED" : .PodcastUrl,
        "TPUB" : .Publisher,
        "WPUB" : .PublisherUrl,
        "TRSN" : .RadioStation,
        "TRSO" : .RadioStationOwner,
        "WORS" : .RadioStationUrl,
        "TSOA" : .SortAlbum,
        "TSO2" : .SortAlbumArtist,
        "TSOP" : .SortArtist,
        "TSOC" : .SortComposer,
        "TSOT" : .SortTitle,
        "TIT3" : .Subtitle,
        //"CTOC" : .TableOfContents,
        "TIT2" : .Title,
        "TRCK" : .TrackPosition,
        "USLT" : .UnsyncedLyrics,
        "TXXX" : .UserDefinedTextInformation,
        "WXXX" : .UserDefinedUrl,
        "APIC" : .AttachedPicture,
    ]
    private var nameForIdentifier: [ID3Version : [String : FrameType]] = [
        .version2 : [
            "TAL" : .Album,
            "TP2" : .AlbumArtist,
            "TP4" : .Arranger,
            "TP1" : .Artist,
            "WAR" : .ArtistUrl,
            "WAS" : .AudioSourceUrl,
            "TBP" : .BPM,
            "COM" : .Comment,
            "TCM" : .Composer,
            "TP3" : .Conductor,
            "TT1" : .ContentGroup,
            "TCR" : .Copyright,
            "WCP" : .CopyrightUrl,
            "TPA" : .DiscPosition,
            "TEN" : .EncodedBy,
            "TSS" : .EncoderSettings,
            "TFT" : .FileType,
            "WAF" : .AudioFileUrl,
            "TCO" : .Genre,
            "TKE" : .InitialKey,
            //"IPL" : .InvolvedPeople,
            "TRC" : .ISRC,
            "TLA" : .Language,
            "TLE" : .Length,
            "TXT" : .Lyricist,
            "TMT" : .MediaType,
            "TOT" : .OriginalAlbum,
            "TOA" : .OriginalArtist,
            "TOF" : .OriginalFilename,
            "TOL" : .OriginalLyricist,
            //"TOR" : .OriginalYear,
            "TDY" : .PlaylistDelay,
            "TPB" : .Publisher,
            "WPB" : .PublisherUrl,
            "TT3" : .Subtitle,
            "TT2" : .Title,
            "TRK" : .TrackPosition,
            "ULT" : .UnsyncedLyrics,
            "TXX" : .UserDefinedTextInformation,
            "WXX" : .UserDefinedUrl,
            "PIC" : .AttachedPicture,
            "TDA" : .RecordingDayMonth,
            "TYE" : .RecordingYear,
            "TIM" : .RecordingHourMinute,
        ],
        .version3 : [
            //"IPLS" : .InvolvedPeople,
            //"TORY" : .OriginalYear,
            "TDAT" : .RecordingDayMonth,
            "TYER" : .RecordingYear,
            "TIME" : .RecordingHourMinute
        ],
        .version4 : [
            //"TIPL" : .InvolvedPeople,
            //"TMCL" : .MusicianCredits,
            //"TDOR" : .OriginalYear,
            "TMOO" : .Mood,
            "TSOP" : .SortPerformer,
            "TDRC" : .RecordingDateTime,
            "TSST" : .SetSubtitle,
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
