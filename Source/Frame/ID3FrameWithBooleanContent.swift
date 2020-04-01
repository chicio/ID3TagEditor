//
//  ID3FrameWithBooleanContent.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/31/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 frame with boolean value, expressed as a four-byte string equaling either 0 or 1.
 */
public class ID3FrameWithBooleanContent: ID3Frame, CustomDebugStringConvertible {
    /// the value being returned.
    public let value: Bool?
    /// ID3FrameWithBooleanContent description, useful for debug.
    public var debugDescription: String {
        return "\(value ?? false)"
    }

    /**
     Init an ID3 recording integer frame.
     
     - parameter value: the value as int.
     */
    public init(value: Bool?) {
        self.value = value
    }
}
