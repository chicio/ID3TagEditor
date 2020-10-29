//
//  ID3FramesCreator.swift
//
//  Created by Fabrizio Duroni on 22/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FramesCreator {
    private let id3FrameCreators: [ID3FrameCreator]

    init(id3FrameCreators: [ID3FrameCreator]) {
        self.id3FrameCreators = id3FrameCreators
    }

    func createFramesUsing(id3Tag: ID3Tag) throws -> [UInt8] {
        var frames = id3FrameCreators.reduce([]) { (accumulator, frameCreator)  in
            accumulator + frameCreator.createFrames(id3Tag: id3Tag)
        }
        if thereIsNotValidDataIn(frames: frames) {
            throw ID3TagEditorError.invalidTagData
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
