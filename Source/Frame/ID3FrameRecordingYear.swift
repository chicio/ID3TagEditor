//
//  ID3FrameRecordingYear.swift
//
//  Created by Fabrizio Duroni on 02/01/2019.
//  2018 Fabrizio Duroni.
//

import Foundation

/// A class that represents the frame 
public class ID3FrameRecordingYear: ID3Frame, CustomDebugStringConvertible {
    /// Recording year of the song.
    public let year: Int?
    
    public init(year: Int?) {
        self.year = year
    }
    
    public var debugDescription: String {
        return "\(year ?? 0)"
    }
}
