//
//  ID3FrameWithStringContent.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3  frame with generic string data  in the ID3 tag.
 This class is used to represent all the ID3 frames that contains plain string as data (e.g. Artist, Album, Title).
*/
public class ID3FrameWithStringContent: ID3Frame {
    /// The content as string.
    public let content: String

    /**
     Init an ID3 frame with string content.

     - parameter content: the content of the ID3 frame.
     */
    public init(content: String) {
        self.content = content
    }
}
