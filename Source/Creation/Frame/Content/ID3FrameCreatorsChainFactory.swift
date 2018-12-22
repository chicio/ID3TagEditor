//
//  ID3FrameCreatorsChainFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameCreatorsChainFactory {
    static func make() -> ID3FrameCreatorsChain {
        let paddingAdder = PaddingAdderToEndOfContentUsingNullChar()
        let frameConfiguration = ID3FrameConfiguration()
        let uInt32ToByteArrayAdapter = UInt32ToByteArrayAdapterUsingUnsafePointer()
        let frameContentSizeCalculator = ID3FrameContentSizeCalculator(
            uInt32ToByteArrayAdapter: uInt32ToByteArrayAdapter,
            synchsafeEncoder: SynchsafeIntegerEncoder()
        )
        let frameFlagsCreator = ID3FrameFlagsCreator()
        let frameFromStringUTF16ContentCreator = ID3FrameFromStringContentCreator(
            frameContentSizeCalculator: frameContentSizeCalculator,
            frameFlagsCreator: frameFlagsCreator,
            stringToBytesAdapter: ID3UTF16StringToByteAdapter(paddingAdder: paddingAdder,
                                                              frameConfiguration: frameConfiguration)
        )
        let frameFromStringISO88591ContentCreator = ID3FrameFromStringContentCreator(
            frameContentSizeCalculator: frameContentSizeCalculator,
            frameFlagsCreator: frameFlagsCreator,
            stringToBytesAdapter: ID3ISO88591StringToByteAdapter(paddingAdder: paddingAdder,
                                                                 frameConfiguration: frameConfiguration)
        )
        let albumFrameCreator = ID3AlbumFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let albumArtistCreator = ID3AlbumArtistFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let artistFrameCreator = ID3ArtistFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let titleFrameCreator = ID3TitleFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let attachedPictureFrameCreator = ID3AttachedPicturesFramesCreator(
            attachedPictureFrameCreator: ID3AttachedPictureFrameCreator(
                id3FrameConfiguration: frameConfiguration,
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                frameContentSizeCalculator: frameContentSizeCalculator,
                frameFlagsCreator: frameFlagsCreator
            )
        )
        let yearFrameCreator = ID3RecordingYearFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let dayMonthCreator = ID3RecordingDayMonthFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let hourMinuteCreator = ID3RecordingHourMinuteFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let genreFrameCreator = ID3GenreFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let trackPositionFrameCreator = ID3TrackPositionFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let recordingDateTimeCreator = ID3RecordingDateTimeFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration,
            timestampCreator: ID3TimestampCreator()
        )
        albumFrameCreator.nextCreator = albumArtistCreator
        albumArtistCreator.nextCreator = artistFrameCreator
        artistFrameCreator.nextCreator = titleFrameCreator
        titleFrameCreator.nextCreator = yearFrameCreator
        yearFrameCreator.nextCreator = dayMonthCreator
        dayMonthCreator.nextCreator = hourMinuteCreator
        hourMinuteCreator.nextCreator = recordingDateTimeCreator
        recordingDateTimeCreator.nextCreator = genreFrameCreator
        genreFrameCreator.nextCreator = trackPositionFrameCreator
        trackPositionFrameCreator.nextCreator = attachedPictureFrameCreator
        return albumFrameCreator
    }
}
