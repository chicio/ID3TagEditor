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
        let subdata = frame.subdata(in: 0 ..< frameIdentifierSize)
        guard let frameIdentifier = String(data: subdata, encoding: .utf8) else {
            return nil
        }

        let frameIdentifierNumeric: UInt32
        switch version {
        case .version2:
            frameIdentifierNumeric = UInt32(subdata[2]) << 16 | UInt32(subdata[1]) << 8 | UInt32(subdata[0])

        case .version3, .version4:
            frameIdentifierNumeric = subdata.withUnsafeBytes { buffer in
                buffer.loadUnaligned(as: UInt32.self).littleEndian
            }
        }
        return (frameIdentifier, frameIdentifierNumeric)
    }
}
