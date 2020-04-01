//
//  ID3ITunesCompilationFlagFrameCreator.swift
//
//  Created by Nolaine Crusher on 03/31/2020.
//  2018 Fabrizio Duroni.
//

class ID3ItunesCompilationFlagFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let compilationFrame = id3Tag.frames[.ITunesCompilation] as? ID3FrameWithBooleanContent,
            let compilationSetting = compilationFrame.value {
            return createFrameUsing(frameType: .ITunesCompilation, content: String(compilationSetting), id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
