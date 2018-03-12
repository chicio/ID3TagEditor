//
//  ID3FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameStringContentParsingOperation: FrameContentParsingOperation {
    private let paddingRemover: PaddingRemover
    private var assignToTagOperation: (ID3Tag, String) -> ()
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(paddingRemover: PaddingRemover,
         id3FrameConfiguration: ID3FrameConfiguration,
         assignToTagOperation: @escaping (ID3Tag, String) -> ()) {
        self.paddingRemover = paddingRemover
        self.id3FrameConfiguration = id3FrameConfiguration
        self.assignToTagOperation = assignToTagOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        let frameContentRange = Range((id3FrameConfiguration.headerSizeFor(version: id3Tag.version))..<frame.count)
        if let frameContent = String(data: frame.subdata(in: frameContentRange), encoding: .ascii) {
            let frameContentWithoutPadding = paddingRemover.removeFrom(string: frameContent)
            assignToTagOperation(id3Tag, frameContentWithoutPadding)
        }
    }
}
