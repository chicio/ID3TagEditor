//
//  ID3ConductorFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3ConductorFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let conductorFrame = id3Tag.frames[.Conductor] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .conductor, content: conductorFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
