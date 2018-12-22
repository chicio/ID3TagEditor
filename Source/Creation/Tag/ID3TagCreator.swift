//
//  ID3TagCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation;

class ID3TagCreator {
    private let id3FrameCreatorsChain: ID3FrameCreatorsChain
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter
    private let id3TagConfiguration: ID3TagConfiguration

    init(id3FrameCreatorsChain: ID3FrameCreatorsChain,
         uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter,
         id3TagConfiguration: ID3TagConfiguration) {
        self.id3FrameCreatorsChain = id3FrameCreatorsChain
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
        self.id3TagConfiguration = id3TagConfiguration
    }

    func create(id3Tag: ID3Tag) throws -> Data {
        let frames = try ID3FramesCreator(id3FrameCreatorsChain: id3FrameCreatorsChain).createFramesUsing(id3Tag: id3Tag)
        let header = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: uInt32ToByteArrayAdapter, id3TagConfiguration: id3TagConfiguration).createTagHeader(contentSize: frames.count, id3Tag: id3Tag)
        let tag = header + frames
        if (isTooBig(tag: tag)) {
            throw ID3TagEditorError.TagTooBig
        }
        return Data(bytes: tag)
    }
    
    private func isTooBig(tag: [UInt8]) -> Bool {
        return tag.count > 0xFFFFFFF
    }
}
