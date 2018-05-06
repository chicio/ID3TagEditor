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
        var frames = id3FrameCreatorsChain.createFrames(id3Tag: id3Tag, tag: [UInt8]())
        if thereIsNotValidDataIn(frames: frames) {
            throw ID3TagEditorError.InvalidTagData
        }
        frames.append(contentsOf: createFramesEnd())
        let header = createTagHeader(contentSize: frames.count, id3Tag: id3Tag);
        let tag = header + frames
        if (isTooBig(tag: tag)) {
            throw ID3TagEditorError.TagTooBig
        }
        return Data(bytes: tag)
    }

    private func thereIsNotValidDataIn(frames: [UInt8]) -> Bool {
        return frames.count == 0
    }

    private func createTagHeader(contentSize: Int, id3Tag: ID3Tag) -> [UInt8] {
        id3Tag.properties.size = UInt32(contentSize)
        let header = id3TagConfiguration.headerFor(version: id3Tag.properties.version) +
                uInt32ToByteArrayAdapter.adapt(uInt32: UInt32(format(size: contentSize)))
        return header
    }

    private func createFramesEnd() -> [UInt8] {
        return [UInt8](repeating: 0, count: 2048)
    }

    private func isTooBig(tag: [UInt8]) -> Bool {
        return tag.count > 0xFFFFFFF
    }

    private func format(size: Int) -> Int {
        var out: Int = 0
        var mask: Int = 0x7F
        var currentValue = size
        while (mask != 0x7FFFFFFF) {
            out = currentValue & ~mask
            out = out << 1
            out = out | currentValue & mask
            mask = ((mask + 1) << 8) - 1
            currentValue = out
        }
        return out
    }
}
