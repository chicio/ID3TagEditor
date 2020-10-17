//
//  ID3FrameRecordingHourMinute.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02.01.19.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 recording hour minute frame to be used in the ID3 tag.
 Valid only for ID3 tag version 2.3 and 2.2.
 */
public class ID3FrameRecordingHourMinute: ID3Frame, CustomDebugStringConvertible {
    /// Recording hour of the song.
    public let hour: Int?
    /// Recording seconds of the song.
    public let minute: Int?
    /// ID3FrameRecordingHourMinute description, useful for debug.
    public var debugDescription: String {
        return "\(hour ?? 0) \(minute ?? 0)"
    }

    /**
     Init an ID3 recording hour minute frame.
     
     - parameter hour: the recording hour of the song.
     - parameter minute: the recording minute of the song.
     */
    public init(hour: Int?, minute: Int?) {
        self.hour = hour
        self.minute = minute
    }
}
