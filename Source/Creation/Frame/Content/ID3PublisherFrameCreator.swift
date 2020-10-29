//
//  ID3PublisherFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3PublisherFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let publisherFrame = id3Tag.frames[.publisher] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .publisher,
                content: publisherFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
