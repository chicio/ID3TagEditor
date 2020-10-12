//
//  ID3UnsynchronisedLyricsFrameContentParsingOperation.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation


class ID3UnsynchronisedLyricsFrameContentParsingOperation: FrameContentParsingOperation {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let stringEncodingDetector: ID3FrameStringEncodingDetector

    init(id3FrameConfiguration: ID3FrameConfiguration,
         stringEncodingDetector: ID3FrameStringEncodingDetector) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.stringEncodingDetector = stringEncodingDetector
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        // TODO:
        // test everything works as expected
        // - manage force unwraps
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)

        let encoding = stringEncodingDetector.detect(frame: frame, version: version)
        let content = String(data: frame.subdata(in: headerSize + 5..<frame.count),
                             encoding: encoding)! //5 = 1 byte encoding + 3 byte language + 1 byte content descriptor
        let language = ID3FrameContentLanguage(rawValue: String(data: frame.subdata(in: headerSize + 2 ..< headerSize + 5), encoding: .utf8)!)!
        
        completed(.UnsynchronizedLyrics(language),
                  ID3FrameUnsynchronisedLyrics(language: language, content: content))
    }
}
