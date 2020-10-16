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
public enum ID3PictureType: UInt8, Equatable, Hashable, CaseIterable {
    /// Other image.
    case other = 0x00
    /// File icon image.
    case fileIcon = 0x01
    /// Other file icon image.
    case otherFileIcon = 0x02
    /// Front cover image.
    case frontCover = 0x03
    /// Back cover image.
    case backCover = 0x04
    /// LeafketPage image.
    case leafletPage = 0x05
    /// Media image.
    case media = 0x06
    /// Lead artist image image.
    case leadArtistLeadPerformerSoloist = 0x07
    /// Artist image image.
    case artistPerformer = 0x08
    /// Conductor image.
    case conductor = 0x09
    /// Orchestra/band image.
    case bandOrchestra = 0x0A
    /// Composer image.
    case composer = 0x0B
    /// Lyricist Text Writer image.
    case lyricistTextWriter = 0x0C
    /// Recording location image.
    case recordingLocation = 0x0D
    /// During recording image.
    case duringRecording = 0x0E
    /// Performance image.
    case duringPerformance = 0x0F
    /// Movie image.
    case movieVideoScreenCapture = 0x10
    /// ABrightColouredFish image.
    case aBrightColouredFish = 0x11
    /// Illustration image.
    case illustration = 0x12
    /// Band logo image.
    case bandArtistLogotype = 0x13
    /// Publisher logo image.
    case publisherStudioLogotype = 0x14
}
