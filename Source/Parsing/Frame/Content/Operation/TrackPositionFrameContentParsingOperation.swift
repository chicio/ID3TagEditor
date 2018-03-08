//
// Created by Fabrizio Duroni on 08.03.18.
// Copyright (c) 2018 Fabrizio Duroni. All rights reserved.
//

import Foundation

class TrackPositionFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParsingOperation: FrameStringContentParsingOperation
    private let trackPositionStringAdapter: TrackPositionStringAdapter

    init(stringContentParsingOperation: FrameStringContentParsingOperation, trackPositionStringAdapter: TrackPositionStringAdapter) {
        self.stringContentParsingOperation = stringContentParsingOperation
        self.trackPositionStringAdapter = trackPositionStringAdapter
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        stringContentParsingOperation.parse(frame: frame, id3Tag: id3Tag) { content in
            id3Tag.trackPosition = trackPositionStringAdapter.adapt(trackPosition: content)
        }
    }
}
