//
//  AlbumFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class AlbumFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParsingOperation: FrameStringContentParsingOperation

    init(stringContentParsingOperation: FrameStringContentParsingOperation) {
        self.stringContentParsingOperation = stringContentParsingOperation
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        stringContentParsingOperation.parse(frame: frame, id3Tag: id3Tag) { content in
            id3Tag.album = content
        }
    }
}
