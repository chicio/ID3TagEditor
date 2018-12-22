//
//  ID3FramesCreator.swift
//
//  Created by Fabrizio Duroni on 22/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FramesCreator {
    private let id3FrameCreatorsChain: ID3FrameCreatorsChain
    
    init(id3FrameCreatorsChain: ID3FrameCreatorsChain) {
        self.id3FrameCreatorsChain = id3FrameCreatorsChain
    }
    
    func createFramesUsing(id3Tag: ID3Tag) throws -> [UInt8] {
        var frames = id3FrameCreatorsChain.createFrames(id3Tag: id3Tag, tag: [UInt8]())
        if thereIsNotValidDataIn(frames: frames) {
            throw ID3TagEditorError.InvalidTagData
        }
        frames.append(contentsOf: createFramesEnd())
        return frames
    }
    
    private func thereIsNotValidDataIn(frames: [UInt8]) -> Bool {
        return frames.count == 0
    }
    
    private func createFramesEnd() -> [UInt8] {
        return [UInt8](repeating: 0, count: 2048)
    }
    
}
