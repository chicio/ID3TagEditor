//
//  ID3FrameCreatorsFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable function_body_length
// swiftlint:disable line_length

import Foundation

class ID3FrameCreatorsFactory {
    static func make() -> [ID3FrameCreator] {
        let paddingAdder = PaddingAdderToEndOfContentUsingNullChar()
        let frameConfiguration = ID3FrameConfiguration()
        let frameFromStringUTF16ContentCreator = ID3FrameFromStringContentCreatorWithUTF16EncodingFactory.make()
        let frameFromStringISO88591ContentCreator = ID3FrameFromStringContentCreatorWithISO88591EncodingFactory.make()

        return [
            ID3AlbumFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3AlbumArtistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3ArtistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3TitleFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingYearFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingDayMonthFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingHourMinuteFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3RecordingDateTimeFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration, timestampCreator: ID3TimestampCreator()),
            ID3GenreFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3TrackPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3AttachedPicturesFramesCreator(
                attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                    id3FrameConfiguration: frameConfiguration,
                    id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                    frameHeaderCreator: ID3FrameHeaderCreatorChain.make()
                )
            ),
            ID3ComposerFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3ConductorFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3ContentGroupingFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3CopyrightFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3EncodedByFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3EncoderSettingsFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3FileOwnerFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesGroupingFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3LyricistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3MixArtistFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementNameFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementIndexFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesMovementCountFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastCategoryFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastDescriptionFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastIDFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3iTunesPodcastKeywordsFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3PublisherFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3SubtitleFrameCreator(frameCreator: frameFromStringUTF16ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3DiscPositionFrameCreator(frameCreator: frameFromStringISO88591ContentCreator, id3FrameConfiguration: frameConfiguration),
            ID3FramesWithLocalizedContentCreator(
                localizedFrameNames: frameNamesWithLocalizedContent,
                localizedFrameCreator: ID3LocalizedFrameCreator(
                    id3FrameConfiguration: frameConfiguration,
                    frameHeaderCreator: ID3FrameHeaderCreatorChain.make(),
                    paddingAdder: paddingAdder
                )
            )
        ]
    }
}
