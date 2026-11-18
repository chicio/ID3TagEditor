//
//  NumericFrameIdentifier.swift
//  ID3TagEditor
//
//  
//

import Foundation

struct NumericFrameIdentifier {
    private init() { }

    /**
     Pack a frame identifier into a numeric type by reading the bytes of the tag frame.

     - parameter data: The raw bytes of the frame. The identifier is assumed to start with the first byte.
     - parameter size: The size of the identifier. Must be:
       - 3 for version-2 tags
       - 4 for version-3 or version-4 tags

     - returns: A `UInt32` with the characters packed little-endian, or `nil` if the identifier is invalid.
     */
    static func read(data: Data, size: Int) -> UInt32? {
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
    }

    private static func validateAndApplyByte(index: Int, data: Data, numeric: inout UInt32) -> Bool {
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
