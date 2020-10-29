//
//  ID3CopyrightFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3CopyrightFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let copyrightFrame = id3Tag.frames[.copyright] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .copyright,
                content: copyrightFrame.content,
                id3Tag: id3Tag
            )
        }
        return []
    }
}
