//
//  ID3FrameContentParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameParser {
    private typealias Identifier = (string: String, numeric: UInt32)
    private let frameContentParsingOperations: [FrameType: FrameContentParsingOperation]
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameContentParsingOperations: [FrameType: FrameContentParsingOperation],
         id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameContentParsingOperations = frameContentParsingOperations
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, frameSize: Int, id3Tag: ID3Tag) {
        let version = id3Tag.properties.version
        guard let identifier = getFrameIdentifier(frame: frame, version: version),
              let frameType = id3FrameConfiguration.frameTypeFor(identifierNumeric: identifier.numeric,
                                                                 version: version) else {
            return
        }

        frameContentParsingOperations[frameType]?.parse(frame: frame,
                                                        version: version,
                                                        completed: { frameName, frame in
            frame.id3Identifier = identifier.string
            frame.size = frameSize
            id3Tag.frames[frameName] = frame
        })
    }

    private func getFrameIdentifier(frame: Data, version: ID3Version) -> Identifier? {
        let frameIdentifierSize = id3FrameConfiguration.identifierSizeFor(version: version)

        guard let frameIdentifierNumeric = NumericFrameIdentifier.read(data: frame, size: frameIdentifierSize) else {
            return nil
        }

        let subdata = frame.subdata(in: 0 ..< frameIdentifierSize)
        guard let frameIdentifier = String(data: subdata, encoding: .ascii) else {
            return nil
        }

        return (string: frameIdentifier, numeric: frameIdentifierNumeric)
    }
}
