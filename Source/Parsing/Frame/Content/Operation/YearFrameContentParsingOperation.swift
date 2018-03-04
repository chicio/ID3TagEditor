//
//  YearFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class YearFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParsingOperation: FrameStringContentParsingOperation

    init(stringContentParsingOperation: FrameStringContentParsingOperation) {
        self.stringContentParsingOperation = stringContentParsingOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        stringContentParsingOperation.parse(frame: frame, id3Tag: id3Tag) { content in
            id3Tag.year = content
        }
    }
}
