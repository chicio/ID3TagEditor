//
//  ID3FrameBooleanContentParser.swift
//
//  Created by Nolaine Crusher on 03/30/2020
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameBooleanContentParserFactory {
    static func make() -> ID3FrameBooleanContentParser {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let paddingRemover = PaddingRemoverUsingTrimming()
        let booleanContentParser = ID3FrameBooleanContentParser(
            paddingRemover: paddingRemover,
            id3FrameConfiguration: id3FrameConfiguration
        )
        return booleanContentParser
    }
}
