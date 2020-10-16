//
//  ID3FrameContentParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameParser {
    private let frameContentParsingOperations: [FrameType: FrameContentParsingOperation]
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameContentParsingOperations: [FrameType: FrameContentParsingOperation],
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameContentParsingOperations = frameContentParsingOperations
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, frameSize: Int, id3Tag: ID3Tag) {
        let frameIdentifier = getFrameIdentifier(frame: frame, version: id3Tag.properties.version)
        let frameType = id3FrameConfiguration.frameTypeFor(identifier: frameIdentifier,
                                                           version: id3Tag.properties.version)
        if isAValid(frameType: frameType) {
            frameContentParsingOperations[frameType]?.parse(frame: frame,
                                                            version: id3Tag.properties.version,
                                                            completed: { frameName, frame in
                frame.id3Identifier = frameIdentifier
                frame.size = frameSize
                id3Tag.frames[frameName] = frame
            })
        }
    }

    private func getFrameIdentifier(frame: Data, version: ID3Version) -> String {
        let frameIdentifierSize = id3FrameConfiguration.identifierSizeFor(version: version)
        let frameIdentifierData = [UInt8](frame.subdata(in: Range(0...frameIdentifierSize - 1)))
        let frameIdentifier = toString(frameIdentifier: frameIdentifierData)
        return frameIdentifier
    }

    private func isAValid(frameType: FrameType) -> Bool {
        return frameType != .invalid
    }

    private func toString(frameIdentifier: [UInt8]) -> String {
        return frameIdentifier.reduce("") { (convertedString, byte) -> String in
            return convertedString + String(Character(UnicodeScalar(byte)))
        }
    }
}
