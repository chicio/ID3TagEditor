//
//  ID3TagCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagCreator {
    let id3FramesCreator: ID3FramesCreator
    let id3TagHeaderCreator: ID3TagHeaderCreator

    init(id3FramesCreator: ID3FramesCreator, id3TagHeaderCreator: ID3TagHeaderCreator) {
        self.id3FramesCreator = id3FramesCreator
        self.id3TagHeaderCreator = id3TagHeaderCreator
    }

    func create(id3Tag: ID3Tag) throws -> Data {
        let frames = try id3FramesCreator.createFramesUsing(id3Tag: id3Tag)
        let header = id3TagHeaderCreator.createTagHeader(contentSize: frames.count, id3Tag: id3Tag)
        let tag = header + frames
        if isTooBig(tag: tag) {
            throw ID3TagEditorError.tagTooBig
        }
        return Data(tag)
    }

    private func isTooBig(tag: [UInt8]) -> Bool {
        return tag.count > 0xFFFFFFF
    }
}
