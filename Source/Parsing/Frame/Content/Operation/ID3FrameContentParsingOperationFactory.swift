//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [FrameType : FrameContentParsingOperation] {
        let paddingRemover = PaddingRemoverUsingTrimming()
        let id3FrameConfiguration = ID3FrameConfiguration()
        let stringParsingContentOperation = ID3FrameStringContentParsingOperation(
                paddingRemover: paddingRemover,
                id3FrameConfiguration: id3FrameConfiguration
        )
        return [
            .Artist: ArtistFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            .Album: AlbumFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            .Title: TitleFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            .AttachedPicture: AttachedPictureFrameContentParsingOperation(
                    id3FrameConfiguration: id3FrameConfiguration,
                    pictureTypeAdapter: ID3PictureTypeAdapter(
                            id3FrameConfiguration: ID3FrameConfiguration(),
                            id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
                    )
            ),
            .Year: YearFrameContentParsingOperation(stringContentParsingOperation: stringParsingContentOperation),
            .Genre: GenreFrameContentParsingOperation(
                    stringContentParsingOperation: stringParsingContentOperation,
                    genreStringAdapter: ID3GenreStringAdapter()
            ),
            .TrackPosition : TrackPositionFrameContentParsingOperation(
                stringContentParsingOperation: stringParsingContentOperation,
                trackPositionStringAdapter: ID3TrackPositionStringAdapter()
            )
        ]
    }
}
