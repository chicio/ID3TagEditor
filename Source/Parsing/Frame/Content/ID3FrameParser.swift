//
//  ID3FrameContentParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameParser: FrameContentParser {
    private let frameContentParsingOperations: [FrameType : FrameContentParsingOperation]
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameContentParsingOperations: [FrameType : FrameContentParsingOperation],
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameContentParsingOperations = frameContentParsingOperations
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        let frameType = getFrameTypeFrom(frame: frame, version: id3Tag.properties.version)
        if (isAValid(frameType: frameType)) {
            frameContentParsingOperations[frameType]?.parse(frame: frame, id3Tag: id3Tag)
        }
    }

    private func getFrameTypeFrom(frame: Data, version: ID3Version) -> FrameType {
        let frameIdentifierSize = id3FrameConfiguration.identifierSizeFor(version: version)
        let frameIdentifierData = [UInt8](frame.subdata(in: Range(0...frameIdentifierSize - 1)))
        let frameIdentifier = toString(frameIdentifier: frameIdentifierData)
        let frameType = id3FrameConfiguration.frameTypeFor(identifier: frameIdentifier, version: version)
        return frameType
    }

    private func isAValid(frameType: FrameType) -> Bool {
        return frameType != .Invalid
    }

    private func toString(frameIdentifier: [UInt8]) -> String {
        return frameIdentifier.reduce("") { (convertedString, byte) -> String in
            return convertedString + String(Character(UnicodeScalar(byte)))
        }
    }
}
