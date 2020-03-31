//
//  ID3PodcastUrlFrameContentParsingOperationFactory.swift
//
//
//  Created by Nolaine Crusher on 3/30/20.
//  2018 Fabrizio Duroni.
//

import Foundation

// NOTE: WFED frame is actually a string frame, not a URL frame
class ID3PodcastUrlFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.PodcastUrl, ID3FrameWithStringContent(content: content))
        }
    }
}
