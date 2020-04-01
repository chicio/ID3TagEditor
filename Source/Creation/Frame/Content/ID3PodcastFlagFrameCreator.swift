//
//  ID3PodcastFlagFrameCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

class ID3PodcastFlagFrameCreator: ID3BooleanFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let podcastFlagFrame = id3Tag.frames[.Podcast] as? ID3FrameWithBooleanContent {
            return createFrameUsing(frameType: .Podcast, value: podcastFlagFrame.value ?? false, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
