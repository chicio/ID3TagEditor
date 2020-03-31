//
//  ID3FrameURLStringContentParser.swift
//
//  Created by Nolaine Crusher on 03/30/2020
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameURLStringContentParserFactory {
    static func make() -> ID3FrameURLStringContentParser {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let paddingRemover = PaddingRemoverUsingTrimming()
        let stringContentParser = ID3FrameURLStringContentParser(
            paddingRemover: paddingRemover,
            id3FrameConfiguration: id3FrameConfiguration
        )
        return stringContentParser
    }
}
