//
//  ID3ParsingOperationForID3FrameWithStringFactory.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.11.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3ParsingOperationForID3FrameWithStringFactory {
    static func make(frameName: FrameName) -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make { (content: String) in
            return (frameName, ID3FrameWithStringContent(content: content))
        }
    }
}
