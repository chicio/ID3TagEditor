//
//  ID3UnsyncedLyricsFrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 27/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UnsyncedLyricsFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.UnsyncedLyrics, ID3FrameWithStringContent(content: content))
        }
    }
}
