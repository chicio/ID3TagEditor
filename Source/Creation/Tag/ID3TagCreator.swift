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
        let frames = try createFramesUsing(id3Tag: id3Tag)
        let header = ID3TagHeaderCreator(uInt32ToByteArrayAdapter: uInt32ToByteArrayAdapter, id3TagConfiguration: id3TagConfiguration).createTagHeader(contentSize: frames.count, id3Tag: id3Tag)
        let tag = header + frames
        if (isTooBig(tag: tag)) {
            throw ID3TagEditorError.TagTooBig
        }
        return Data(bytes: tag)
    }

    private func thereIsNotValidDataIn(frames: [UInt8]) -> Bool {
        return frames.count == 0
    }
    
    private func createFramesUsing(id3Tag: ID3Tag) throws -> [UInt8] {
        var frames = id3FrameCreatorsChain.createFrames(id3Tag: id3Tag, tag: [UInt8]())
        if thereIsNotValidDataIn(frames: frames) {
            throw ID3TagEditorError.InvalidTagData
        }
        frames.append(contentsOf: createFramesEnd())
        return frames
    }

    private func createFramesEnd() -> [UInt8] {
        return [UInt8](repeating: 0, count: 2048)
    }

    private func isTooBig(tag: [UInt8]) -> Bool {
        return tag.count > 0xFFFFFFF
    }
}


class ID3TagHeaderCreator {
    private let uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter
    private let id3TagConfiguration: ID3TagConfiguration
    
    init(uInt32ToByteArrayAdapter: UInt32ToByteArrayAdapter, id3TagConfiguration: ID3TagConfiguration) {
        self.uInt32ToByteArrayAdapter = uInt32ToByteArrayAdapter
        self.id3TagConfiguration = id3TagConfiguration
    }
    
    func createTagHeader(contentSize: Int, id3Tag: ID3Tag) -> [UInt8] {
        id3Tag.properties.size = UInt32(contentSize)
        let flags: [UInt8] = [0x00]
        let header = id3TagConfiguration.headerFor(version: id3Tag.properties.version)
            + flags
            + uInt32ToByteArrayAdapter.adapt(uInt32: SynchsafeIntegerEncoder().encode(integer: id3Tag.properties.size))
        return header
    }
}
