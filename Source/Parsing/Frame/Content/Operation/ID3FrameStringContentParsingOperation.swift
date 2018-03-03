//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperation: FrameStringContentParsingOperation {
    private let paddingRemover: PaddingRemover
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(paddingRemover: PaddingRemover, id3FrameConfiguration: ID3FrameConfiguration) {
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, id3Tag: ID3Tag, finish: (String) -> ()) {
        let frameContentRange = Range((id3FrameConfiguration.headerSizeFor(version: id3Tag.version))..<frame.count)
        if let frameContent = String(data: frame.subdata(in: frameContentRange), encoding: .ascii) {
            let frameContentWithoutPadding = paddingRemover.removeFrom(string: frameContent)
            finish(frameContentWithoutPadding)
        }
    }
}
