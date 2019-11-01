//
//  ID3FrameRecordingYear.swift
//
//  Created by Fabrizio Duroni on 02/01/2019.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 recording year frame to be used in the ID3 tag. Valid only for ID3 tag version 2.3 and 2.2.
 */
public class ID3FrameRecordingYear: ID3Frame, CustomDebugStringConvertible {
    /// Recording year of the song.
    public let year: Int?
    /// ID3FrameRecordingYear description, useful for debug.
    public var debugDescription: String {
        return "\(year ?? 0)"
    }

    /**
     Init an ID3 recording year  frame.
     
     - parameter year: a year as int.
     */
    public init(year: Int?) {
        self.year = year
    }
}
