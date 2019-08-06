//
//  ID3FrameContentParsingOperationFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameContentParsingOperationFactory {
    static func make() -> [FrameType : FrameContentParsingOperation] {
        return [
            .Artist: ID3ArtistFrameContentParsingOperationFactory.make(),
            .AlbumArtist: ID3AlbumArtistFrameContentParsingOperationFactory.make(),
            .Album: ID3AlbumFrameContentParsingOperationFactory.make(),
            .Title: ID3TitleFrameContentParsingOperationFactory.make(),
            .AttachedPicture: ID3AttachedPictureFrameContentParsingOperationFactory.make(),
            .RecordingDayMonth: ID3RecordingDayMonthFrameContentParsingOperationFactory.make(),
            .RecordingYear: ID3RecordingYearFrameContentParsingOperationFactory.make(),
            .RecordingHourMinute: ID3RecordingHourMinuteFrameContentParsingOperationFactory.make(),
            .RecordingDateTime: ID3RecordingTimeFrameContentParsingOperationFactory.make(),
            .Genre: ID3GenreFrameContentParsingOperationFactory.make(),
            .TrackPosition: ID3TrackPositionFrameContentParsingOperationFactory.make(),
            .Popularimeter: ID3PopularimeterFrameContentParsingOperationFactory.make()
        ]
    }
}
