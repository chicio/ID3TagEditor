//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [FrameType : FrameContentParsingOperation] {
        let id3FrameConfiguration = ID3FrameConfiguration()
        let paddingRemover = PaddingRemoverUsingTrimming()
        let stringEncodingDetector = ID3FrameStringEncodingDetector(
            id3FrameConfiguration: id3FrameConfiguration,
            id3StringEncodingConverter: ID3StringEncodingConverter()
        )
        return [
            .Artist: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover, 
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.artist = frameContentWithoutPadding
            },
            .AlbumArtist: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.albumArtist = frameContentWithoutPadding
            },
            .Album: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.album = frameContentWithoutPadding
            },
            .Title: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.title = frameContentWithoutPadding
            },
            .AttachedPicture: ID3AttachedPictureFrameContentParsingOperation(
                    id3FrameConfiguration: id3FrameConfiguration,
                    pictureTypeAdapter: ID3PictureTypeAdapter(
                            id3FrameConfiguration: ID3FrameConfiguration(),
                            id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration()
                    )
            ),
            .Year: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.year = frameContentWithoutPadding
            },
            .Genre: ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.genre = ID3GenreStringAdapter().adapt(genre: frameContentWithoutPadding)
            },
            .TrackPosition : ID3FrameStringContentParsingOperation(
                    stringEncodingDetector: stringEncodingDetector,
                    paddingRemover: paddingRemover,
                    id3FrameConfiguration: id3FrameConfiguration
            ) { (id3Tag: ID3Tag, frameContentWithoutPadding: String) in
                id3Tag.trackPosition = ID3TrackPositionStringAdapter().adapt(trackPosition: frameContentWithoutPadding)
            }
        ]
    }
}
