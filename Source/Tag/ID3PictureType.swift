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
public enum ID3PictureType: UInt8, Equatable {
    case Other = 0x00
    case fileIcon = 0x01
    case OtherFileIcon = 0x02
    case FrontCover = 0x03
    case BackCover = 0x04
    case LeafletPage = 0x05
    case Media = 0x06
    case LeadArtistLeadPerformerSoloist = 0x07
    case ArtistPerformer = 0x08
    case Conductor = 0x09
    case BandOrchestra = 0x0A
    case Composer = 0x0B
    case LyricistTextWriter = 0x0C
    case RecordingLocation = 0x0D
    case DuringRecording = 0x0E
    case DuringPerformance = 0x0F
    case MovieVideoScreenCapture = 0x10
    case ABrightColouredFish = 0x11
    case Illustration = 0x12
    case BandArtistLogotype = 0x13
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
