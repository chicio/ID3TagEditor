//
//  ID3AttachedPicturesFramesCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPicturesFramesCreator: ID3FrameCreatorsChain {
    private let attachedPictureFrameCreator: AttachedPictureFrameCreator

    init(attachedPictureFrameCreator: AttachedPictureFrameCreator) {
        self.attachedPictureFrameCreator = attachedPictureFrameCreator
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let attachedPictures = id3Tag.attachedPictures {
            var frames: [UInt8] = []
            for attachedPicture in attachedPictures {
                let frame = attachedPictureFrameCreator.createFrame(using: attachedPicture, id3Tag: id3Tag)
                frames.append(contentsOf: frame)
            }
            return tag + frames
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
