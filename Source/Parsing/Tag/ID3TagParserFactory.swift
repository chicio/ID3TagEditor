//
//  ID3TagParserFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3TagParserFactory {
    static func make() -> ID3TagParser {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let id3TagConfiguration = ID3TagConfiguration()
        let id3TagParser = ID3TagParser(
            tagVersionParser: ID3TagVersionParser(),
            tagPresence: ID3TagPresence(id3TagConfiguration: id3TagConfiguration),
            tagSizeParser: ID3TagSizeParser(),
            id3TagConfiguration: id3TagConfiguration,
            frameParser: ID3FramesParser(
                frameSizeParser: ID3FrameSizeParser(
                    frameContentSizeParser: ID3FrameContentSizeParser(
                        id3FrameConfiguration: id3FrameConfiguration,
                        synchsafeIntegerDecoder: SynchsafeIntegerDecoder()),
                    id3FrameConfiguration: id3FrameConfiguration
                ),
                id3FrameParser: ID3FrameParser(
                    frameContentParsingOperations: ID3FrameContentParsingOperationFactory.make(),
                    id3FrameConfiguration: id3FrameConfiguration
                ),
                id3TagConfiguration: id3TagConfiguration
            )
        )
        return id3TagParser
    }
}
