//
//  ID3FrameWithIntegerContent.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 frame with an integer value.
 */
public class ID3FrameWithIntegerContent: ID3Frame, CustomDebugStringConvertible {
    /// the value being returned.
    public let value: Int?
    /// ID3FrameWithIntegerContent description, useful for debug.
    public var debugDescription: String {
        return "\(value ?? 0)"
    }

    /**
     Init an ID3 recording integer frame.
     
     - parameter value: the value as int.
     */
    public init(value: Int?) {
        self.value = value
    }
}
