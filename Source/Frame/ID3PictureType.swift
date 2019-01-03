//
//  ID3PictureType.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 An enum that describes the ID3 picture type supported.
 */
public enum ID3PictureType: UInt8, Equatable, CaseIterable {
    /// Other image.
    case Other = 0x00
    /// File icon image.
    case fileIcon = 0x01
    /// Other file icon image.
    case OtherFileIcon = 0x02
    /// Front cover image.
    case FrontCover = 0x03
    /// Back cover image.
    case BackCover = 0x04
    /// LeafketPage image.
    case LeafletPage = 0x05
    /// Media image.
    case Media = 0x06
    /// Lead artist image image.
    case LeadArtistLeadPerformerSoloist = 0x07
    /// Artist image image.
    case ArtistPerformer = 0x08
    /// Conductor image.
    case Conductor = 0x09
    /// Orchestra/band image.
    case BandOrchestra = 0x0A
    /// Composer image.
    case Composer = 0x0B
    /// Lyricist Text Writer image.
    case LyricistTextWriter = 0x0C
    /// Recording location image.
    case RecordingLocation = 0x0D
    /// During recording image.
    case DuringRecording = 0x0E
    /// Performance image.
    case DuringPerformance = 0x0F
    /// Movie image.
    case MovieVideoScreenCapture = 0x10
    /// ABrightColouredFish image.
    case ABrightColouredFish = 0x11
    /// Illustration image.
    case Illustration = 0x12
    /// Band logo image.
    case BandArtistLogotype = 0x13
    /// Publisher logo image.
    case PublisherStudioLogotype = 0x14

    /**
     Compare two ID3PictureType.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the picture types are the same, else false.
     */
    public static func ==(lhs: ID3PictureType, rhs: ID3PictureType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
