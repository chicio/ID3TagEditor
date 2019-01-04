//
//  ID3FrameWithStringContent.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public class ID3FrameWithStringContent: ID3Frame {
    public let content: String
    
    public init(content: String) {
        self.content = content
    }
}
