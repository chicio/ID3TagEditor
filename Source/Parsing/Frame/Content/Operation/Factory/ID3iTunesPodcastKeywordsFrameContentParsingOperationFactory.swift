//
//  ID3iTunesPodcastKeywordsFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastKeywordsFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.iTunesPodcastKeywords, ID3FrameWithStringContent(content: content))
        }
    }
}
