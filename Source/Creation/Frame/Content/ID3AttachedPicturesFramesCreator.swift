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
        var frames: [UInt8] = []
        for pictureType in ID3PictureType.allCases {
            if let attachedPictureFrame = id3Tag.frames[.AttachedPicture(pictureType)] as? ID3FrameAttachedPicture {
                let frame = attachedPictureFrameCreator.createFrame(using: attachedPictureFrame, id3Tag: id3Tag)
                frames.append(contentsOf: frame)
            }
        }
        if frames.count > 0 {
            return tag + frames
        }
        
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
