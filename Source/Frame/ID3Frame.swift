//
//  ID3Frame.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class that represent an ID3Tag frame. It contains the common information of all the ID3 frames.
 */
public class ID3Frame {
    /// The ID3 frame identifier as specified in the ID3 tag standard.
    public internal(set) var id3Identifier: String?
    /// The ID3 frame size as specified in the ID3 tag standard.
    public internal(set) var size: Int?
}
