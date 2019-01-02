//
//  ID3FrameRecordingDayMonth.swift
//
//  Created by Fabrizio Duroni on 02/01/2019.
//  2018 Fabrizio Duroni.
//

import Foundation

public class ID3FrameRecordingDayMonth: ID3Frame, CustomDebugStringConvertible {
    /// Recording day of the song.
    public let day: Int?
    /// Recording month of the song.
    public let month: Int?
    
    public init(day: Int?, month: Int?) {
        self.day = day
        self.month = month
    }
    
    public var debugDescription: String {
        return "\(day ?? 0) \(month ?? 0)"
    }
}
