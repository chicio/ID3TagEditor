//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [String : FrameContentParsingOperation] {
        let paddingRemover = PaddingRemoverUsingTrimming()
        let id3FrameConfiguration = ID3FrameConfiguration()
        let stringParsingContentOperation = ID3FrameStringContentParsingOperation(
                paddingRemover: paddingRemover,
                id3FrameConfiguration: id3FrameConfiguration
        )
        return [
            "artist" : ArtistFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            "album" : AlbumFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            "title" : TitleFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            "artwork" : ArtworkFrameContentParsingOperation(id3FrameConfiguration: id3FrameConfiguration)
        ]
    }
}
