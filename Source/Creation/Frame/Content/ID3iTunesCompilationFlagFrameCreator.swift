//
//  ID3iTunesCompilationFlagFrameCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

class ID3iTunesCompilationFlagFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let compilationFrame = id3Tag.frames[.iTunesCompilation] as? ID3FrameWithBooleanContent,
            let compilationSetting = compilationFrame.value {
            if compilationSetting == true {
                return createFrameUsing(frameType: .iTunesCompilation, content: "1", id3Tag: id3Tag, andAddItTo: tag)
            } else {
                return createFrameUsing(frameType: .iTunesCompilation, content: "0", id3Tag: id3Tag, andAddItTo: tag)
            }
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
