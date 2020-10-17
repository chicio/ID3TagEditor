//
//  ID3FrameRecordingDayMonth.swift
//
//  Created by Fabrizio Duroni on 02/01/2019.
//  2019 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 recording day month frame to be used in the ID3 tag.
 Valid only for ID3 tag version 2.3 and 2.2.
 */
public class ID3FrameRecordingDayMonth: ID3Frame, CustomDebugStringConvertible {
    /// Recording day of the song.
    public let day: Int?
    /// Recording month of the song.
    public let month: Int?
    /// ID3FrameRecordingDayMonth description, useful for debug.
    public var debugDescription: String {
        return "\(day ?? 0) \(month ?? 0)"
    }

    /**
     Init an ID3 recording day month  frame.
     
     - parameter day: a day as int.
     - parameter month: a month as int.
     */
    public init(day: Int?, month: Int?) {
        self.day = day
        self.month = month
    }
}
