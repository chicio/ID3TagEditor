//
//  ID3FrameContentParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParser: FrameContentParser {
    private let frameContentParsingOperations: [String : FrameContentParsingOperation]
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameContentParsingOperations: [String : FrameContentParsingOperation],
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameContentParsingOperations = frameContentParsingOperations
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        let frameName = getFrameNameFrom(frame: frame, version: id3Tag.version)
        if (isAValid(frameName: frameName)) {
            frameContentParsingOperations[frameName]?.parse(frame: frame, id3Tag: id3Tag)
        }
    }

    func getFrameNameFrom(frame: Data, version: ID3Version) -> String {
        let frameIdentifierSize = id3FrameConfiguration.identifierSizeFor(version: version)
        let frameIdentifierData = [UInt8](frame.subdata(in: Range(0...frameIdentifierSize - 1)))
        let frameIdentifier = toString(frameIdentifier: frameIdentifierData)
        let frameName = id3FrameConfiguration.nameFor(identifier: frameIdentifier, version: version)
        return frameName
    }

    private func isAValid(frameName: String) -> Bool {
        return frameName != ""
    }

    private func toString(frameIdentifier: [UInt8]) -> String {
        return frameIdentifier.reduce("") { (convertedString, byte) -> String in
            return convertedString + String(Character(UnicodeScalar(byte)))
        }
    }
}
