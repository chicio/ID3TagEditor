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

        guard let frameIdentifierNumeric = getFrameIdentifierNumeric(data: frame, size: frameIdentifierSize) else {
            return nil
        }

        let subdata = frame.subdata(in: 0 ..< frameIdentifierSize)
        guard let frameIdentifier = String(data: subdata, encoding: .ascii) else {
            return nil
        }

        return (string: frameIdentifier, numeric: frameIdentifierNumeric)
    }
}

func getFrameIdentifierNumeric(data: Data, size: Int) -> UInt32? {
    guard size <= data.count else {
        return nil
    }

    var frameIdentifierNumeric: UInt32 = 0

    // Performance note:
    // This switch is 20% faster than the loop "for index in (0 ..< frameIdentifierSize).reversed()"
    switch size {
    case 4:
        guard validateAndApplyByte(index: 3, data: data, numeric: &frameIdentifierNumeric) else { return nil }
        fallthrough

    case 3:
        guard validateAndApplyByte(index: 2, data: data, numeric: &frameIdentifierNumeric) else { return nil }
        guard validateAndApplyByte(index: 1, data: data, numeric: &frameIdentifierNumeric) else { return nil }
        guard validateAndApplyByte(index: 0, data: data, numeric: &frameIdentifierNumeric) else { return nil }

    default:
        return nil
    }

    return frameIdentifierNumeric

    func validateAndApplyByte(index: Int, data: Data, numeric: inout UInt32) -> Bool {
        let byte = data[index]

        // Accept ASCII codes for characters 0-9, A-Z, a-z.
        // Performance note: Defining the constants here is 8% faster than using a static enum.
        let zero = 0x30
        let nine = 0x39
        let capA = 0x41
        let capZ = 0x5A
        let lowA = 0x61
        let lowZ = 0x7A
        guard (zero <= byte && byte <= nine) || (capA <= byte && byte <= capZ) || (lowA <= byte && byte <= lowZ) else {
            return false
        }

        let shifted = UInt32(byte) << (index * 8)
        numeric |= shifted

        return true
    }
}
