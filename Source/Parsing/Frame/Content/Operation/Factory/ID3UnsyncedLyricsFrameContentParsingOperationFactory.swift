//
//  ID3UnsyncedLyricsFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3UnsyncedLyricsFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (language: String?, contentDescription: String, contentText: String) in
            #warning("I don't know what to do for an adaptor here, if anything")
            return (.UnsyncedLyrics, ID3FrameCommentLyrics(language: <#T##String?#>, contentDescription: <#T##String?#>, contentText: <#T##String#>))

        }
    }
}
