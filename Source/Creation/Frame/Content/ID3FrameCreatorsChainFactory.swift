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
        let frameFromMultiStringISO88591ContentCreator = ID3CommentTypesFrameCreator(
            frameContentSizeCalculator: frameContentSizeCalculator,
            frameFlagsCreator: frameFlagsCreator,
            stringToBytesAdapter: ID3ISO88591StringToByteAdapter(paddingAdder: paddingAdder,
                                                                 frameConfiguration: frameConfiguration)
        )
        let frameFromUserTextISO88591ContentCreator = ID3UserDefinedTextFrameCreator(
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
        let composerFrameCreator = ID3ComposerFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let conductorFrameCreator = ID3ConductorFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let contentGroupingFrameCreator = ID3ContentGroupingFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let copyrightFrameCreator = ID3CopyrightFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let encodedByFrameCreator = ID3EncodedByFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let encoderSettingsFrameCreator = ID3EncoderSettingsFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let fileOwnerFrameCreator = ID3FileOwnerFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let fileTypeFrameCreator = ID3FileTypeFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let iTunesGroupingFrameCreator = ID3iTunesGroupingFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let lyricistFrameCreator = ID3LyricistFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let mediaTypeFrameCreator = ID3MediaTypeFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let mixArtistFrameCreator = ID3MixArtistFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let iTunesMovementNameFrameCreator = ID3ItunesMovementNameFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let podcastCategoryFrameCreator = ID3PodcastCategoryFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let podcastDescriptionFrameCreator = ID3PodcastDescriptionFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let podcastIDFrameCreator = ID3PodcastIDFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let podcastKeywordsFrameCreator = ID3PodcastKeywordsFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let publisherFrameCreator = ID3PublisherFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let subtitleFrameCreator = ID3SubtitleFrameCreator(
            frameCreator: frameFromStringUTF16ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let userDefinedTextInformationFrameCreator = ID3UserDefinedTextInformationFrameCreator(
            frameCreator: frameFromUserTextISO88591ContentCreator,
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
        let unsyncedLyricsFrameCreator = ID3UnsyncedLyricsFrameCreator(
            frameCreator: frameFromMultiStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let commentFrameCreator = ID3CommentFrameCreator(
            frameCreator: frameFromMultiStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let languageFrameCreator = ID3LanguageFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let trackPositionFrameCreator = ID3TrackPositionFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let discPositionFrameCreator = ID3DiscPositionFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let iTunesMovementIndexFrameCreator = ID3ItunesMovementIndexFrameCreator(
            frameCreator: frameFromStringISO88591ContentCreator,
            id3FrameConfiguration: frameConfiguration
        )
        let iTunesMovementCountFrameCreator = ID3ItunesMovementCountFrameCreator(
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
        attachedPictureFrameCreator.nextCreator = composerFrameCreator
        composerFrameCreator.nextCreator = conductorFrameCreator
        conductorFrameCreator.nextCreator = contentGroupingFrameCreator
        contentGroupingFrameCreator.nextCreator = copyrightFrameCreator
        copyrightFrameCreator.nextCreator = encodedByFrameCreator
        encodedByFrameCreator.nextCreator = encoderSettingsFrameCreator
        encoderSettingsFrameCreator.nextCreator = fileOwnerFrameCreator
        fileOwnerFrameCreator.nextCreator = fileTypeFrameCreator
        fileTypeFrameCreator.nextCreator = iTunesGroupingFrameCreator
        iTunesGroupingFrameCreator.nextCreator = lyricistFrameCreator
        lyricistFrameCreator.nextCreator = mediaTypeFrameCreator
        mediaTypeFrameCreator.nextCreator = mixArtistFrameCreator
        mixArtistFrameCreator.nextCreator = iTunesMovementNameFrameCreator
        iTunesMovementNameFrameCreator.nextCreator = iTunesMovementIndexFrameCreator
        iTunesMovementIndexFrameCreator.nextCreator = iTunesMovementCountFrameCreator
        iTunesMovementCountFrameCreator.nextCreator = podcastCategoryFrameCreator
        podcastCategoryFrameCreator.nextCreator = podcastDescriptionFrameCreator
        podcastDescriptionFrameCreator.nextCreator = podcastIDFrameCreator
        podcastIDFrameCreator.nextCreator = podcastKeywordsFrameCreator
        podcastKeywordsFrameCreator.nextCreator = publisherFrameCreator
        publisherFrameCreator.nextCreator = subtitleFrameCreator
        subtitleFrameCreator.nextCreator = unsyncedLyricsFrameCreator
        unsyncedLyricsFrameCreator.nextCreator = commentFrameCreator
        commentFrameCreator.nextCreator = languageFrameCreator
        languageFrameCreator.nextCreator = discPositionFrameCreator
        discPositionFrameCreator.nextCreator = userDefinedTextInformationFrameCreator
        return albumFrameCreator
    }
}
