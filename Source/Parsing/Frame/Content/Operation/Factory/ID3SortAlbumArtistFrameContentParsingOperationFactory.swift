//
//  ID3SortAlbumArtistFrameContentParsingOperationFactory.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3SortAlbumArtistFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (content: String) in
            return (.SortAlbumArtist, ID3FrameWithStringContent(content: content))
        }
    }
}
