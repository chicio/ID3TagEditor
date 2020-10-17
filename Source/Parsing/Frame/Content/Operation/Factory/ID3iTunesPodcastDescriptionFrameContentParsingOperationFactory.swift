//
//  ID3iTunesPodcastDescriptionFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3iTunesPodcastDescriptionFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make { (content: String) in
            return (.iTunesPodcastDescription, ID3FrameWithStringContent(content: content))
        }
    }
}
