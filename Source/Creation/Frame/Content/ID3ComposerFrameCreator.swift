//
//  ID3ComposerFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//
import Foundation

class ID3ComposerFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let composerFrame = id3Tag.frames[.Composer] as? ID3FrameWithStringContent {
            return createFrameUsing(frameType: .Composer, content: composerFrame.content, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
