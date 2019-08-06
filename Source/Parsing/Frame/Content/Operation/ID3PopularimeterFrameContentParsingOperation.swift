//
//  ID3 PopularimeterFrameContentParsingOperation.swift
//  mplayer
//
//  Created by Alex on 11 Jul 19.
//  Copyright © 2019 Aleksey Lebedev. All rights reserved.
//

import Foundation

class ID3PopularimeterFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParser: ID3FrameStringContentParser
    private let id3FrameConfiguration: ID3FrameConfiguration

    init(stringContentParser: ID3FrameStringContentParser, id3FrameConfiguration: ID3FrameConfiguration) {
        self.stringContentParser = stringContentParser
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        guard frame.count - headerSize > 5 else { return }
        let ratingPosition = frame.count - 5
        let counterPosition = frame.count - 4
        let email = stringContentParser.parse(frame: frame.subdata(in: 0..<ratingPosition), version: version) ?? ""
        let nsDataFrame = frame as NSData
        var rating: UInt8 = 0
        nsDataFrame.getBytes(&rating, range: NSMakeRange(ratingPosition, 1))
        var counter: UInt32 = 0
        nsDataFrame.getBytes(&counter, range: NSMakeRange(counterPosition, 4))
        counter = counter.bigEndian
        completed(.Popularimeter, ID3FramePopularimeter(email: email, rating: Int(rating), counter: Int(counter)))
    }
}
