//
//  ID3ITunesCompilationFlagFrameCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

class ID3PodcastFlagFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let podcastFrame = id3Tag.frames[.Podcast] as? ID3FrameWithBooleanContent,
            let podcastSetting = podcastFrame.value {
            if podcastSetting == true {
                return createFrameUsing(frameType: .Podcast, content: "1", id3Tag: id3Tag, andAddItTo: tag)
            } else {
                return createFrameUsing(frameType: .Podcast, content: "0", id3Tag: id3Tag, andAddItTo: tag)
            }
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
