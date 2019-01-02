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
        .AlbumArtist : [UInt8]("TPE2".utf8),
        .Title : [UInt8]("TIT2".utf8),
        .Album : [UInt8]("TALB".utf8),
        .AttachedPicture : [UInt8]("APIC".utf8),
        .Genre : [UInt8]("TCON".utf8),
        .TrackPosition : [UInt8]("TRCK".utf8)
    ]
    private var identifiers: [ID3Version : [FrameType : [UInt8]]] = [
        .version2 : [
            .Artist : [UInt8]("TP1".utf8),
            .AlbumArtist : [UInt8]("TP2".utf8),
            .Title : [UInt8]("TT2".utf8),
            .Album : [UInt8]("TAL".utf8),
            .AttachedPicture : [UInt8]("PIC".utf8),
            .RecordingDayMonth : [UInt8]("TDA".utf8),
            .RecordingYear : [UInt8]("TYE".utf8),
            .RecordingHourMinute : [UInt8]("TIM".utf8),
            .Genre : [UInt8]("TCO".utf8),
            .TrackPosition : [UInt8]("TRK".utf8)
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
        "TPE2" : .AlbumArtist,
        "TIT2" : .Title,
        "TALB" : .Album,
        "APIC" : .AttachedPicture,
        "TCON" : .Genre,
        "TRCK" : .TrackPosition
    ]
    private var nameForIdentifier: [ID3Version : [String : FrameType]] = [
        .version2 : [
            "TP1" : .Artist,
            "TP2" : .AlbumArtist,
            "TT2" : .Title,
            "TAL" : .Album,
            "PIC" : .AttachedPicture,
            "TDA" : .RecordingDayMonth,
            "TYE" : .RecordingYear,
            "TIM" : .RecordingHourMinute,
            "TCO" : .Genre,
            "TRK" : .TrackPosition
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
    private let attachedPictureFrameNameForType: [ID3PictureType : FrameName] = [
        .Other : .AttachedPictureOther,
        .fileIcon : .AttachedPicturefileIcon,
        .OtherFileIcon : .AttachedPictureOtherFileIcon,
        .FrontCover : .AttachedPictureFrontCover,
        .BackCover : .AttachedPictureBackCover,
        .LeafletPage : .AttachedPictureLeafletPage,
        .Media : .AttachedPictureMedia,
        .LeadArtistLeadPerformerSoloist : .AttachedPictureLeadArtistLeadPerformerSoloist,
        .ArtistPerformer : .AttachedPictureArtistPerformer,
        .Conductor : .AttachedPictureConductor,
        .BandOrchestra : .AttachedPictureBandOrchestra,
        .Composer : .AttachedPictureComposer,
        .LyricistTextWriter : .AttachedPictureLyricistTextWriter,
        .RecordingLocation : .AttachedPictureRecordingLocation,
        .DuringRecording : .AttachedPictureDuringRecording,
        .DuringPerformance : .AttachedPictureDuringPerformance,
        .MovieVideoScreenCapture : .AttachedPictureMovieVideoScreenCapture,
        .ABrightColouredFish : .AttachedPictureABrightColouredFish,
        .Illustration : .AttachedPictureIllustration,
        .BandArtistLogotype : .AttachedPictureBandArtistLogotype,
        .PublisherStudioLogotype : .AttachedPicturePublisherStudioLogotype,
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
    
    func attachedPictureFrameNameFor(pictureType: ID3PictureType) -> FrameName {
        return attachedPictureFrameNameForType[pictureType]!
    }
}
