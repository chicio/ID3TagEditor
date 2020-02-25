//
//  ID3LyricistFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3LyricistFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.Lyricist, ID3FrameWithStringContent(content: content))
        }
    }
}
