import XCTest

extension ID3AlbumArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnAlbumArtist", testFrameCreationWhenThereIsAnAlbumArtist),
        ("testNoFrameCreationWhenThereIsNoAlbumArtist", testNoFrameCreationWhenThereIsNoAlbumArtist),
    ]
}

extension ID3AlbumFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnAlbum", testFrameCreationWhenThereIsAnAlbum),
        ("testNoFrameCreationWhenThereIsNoAlbum", testNoFrameCreationWhenThereIsNoAlbum),
    ]
}

extension ID3ArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnArtist", testFrameCreationWhenThereIsAnArtist),
        ("testNoFrameCreationWhenThereIsNoArtist", testNoFrameCreationWhenThereIsNoArtist),
    ]
}

extension ID3AttachedPictureFrameContentParsingOperationTest {
    static let __allTests = [
        ("testSetTagAttachedPictureJpg", testSetTagAttachedPictureJpg),
        ("testSetTagAttachedPicturePng", testSetTagAttachedPicturePng),
    ]
}

extension ID3AttachedPicturesFramesCreatorTest {
    static let __allTests = [
        ("testFrameCreationWithJpgForVersion2", testFrameCreationWithJpgForVersion2),
        ("testFrameCreationWithJpgForVersion3", testFrameCreationWithJpgForVersion3),
        ("testFrameCreationWithPngForAnotherTypeOfCover", testFrameCreationWithPngForAnotherTypeOfCover),
        ("testFrameCreationWithPngForVersion2", testFrameCreationWithPngForVersion2),
        ("testFrameCreationWithPngForVersion3", testFrameCreationWithPngForVersion3),
        ("testNoFrameCreationWhenThereIsNoImage", testNoFrameCreationWhenThereIsNoImage),
    ]
}

extension ID3FrameConfigurationTest {
    static let __allTests = [
        ("testInvalidIdentifierName", testInvalidIdentifierName),
    ]
}

extension ID3FrameContentSizeCalculatorTest {
    static let __allTests = [
        ("testContentCalculateSizeForVersion2", testContentCalculateSizeForVersion2),
        ("testContentCalculateSizeForVersion3", testContentCalculateSizeForVersion3),
    ]
}

extension ID3FrameCreatorsChainTest {
    static let __allTests = [
        ("testCurrentTagBytesAreReturnedWhenThereIsNotANextCreator", testCurrentTagBytesAreReturnedWhenThereIsNotANextCreator),
        ("testNextCreatorCalled", testNextCreatorCalled),
    ]
}

extension ID3FrameFlagsCreatorTest {
    static let __allTests = [
        ("testFlagsForVersion2", testFlagsForVersion2),
        ("testFlagsForVersion3", testFlagsForVersion3),
    ]
}

extension ID3FrameFromStringContentCreatorTest {
    static let __allTests = [
        ("testCreatorFrameFromStringContent", testCreatorFrameFromStringContent),
    ]
}

extension ID3GenreFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAGenre", testFrameCreationWhenThereIsAGenre),
        ("testNoFrameCreationWhenThereIsNoGenre", testNoFrameCreationWhenThereIsNoGenre),
    ]
}

extension ID3GenreStringAdapterTest {
    static let __allTests = [
        ("testAdaptGenreWithDescription", testAdaptGenreWithDescription),
        ("testAdaptGenreWithoutDescription", testAdaptGenreWithoutDescription),
        ("testAdaptGenreWithoutGenreIdentifier", testAdaptGenreWithoutGenreIdentifier),
        ("testAdaptID3v3NewGenresNotNumeric", testAdaptID3v3NewGenresNotNumeric),
    ]
}

extension ID3ISO88591StringToByteAdapterTest {
    static let __allTests = [
        ("testEncodeStringToISO88591WithEncodingByte", testEncodeStringToISO88591WithEncodingByte),
    ]
}

extension ID3PictureTypeAdapterTest {
    static let __allTests = [
        ("testExtractTypeFromV2TagJpg", testExtractTypeFromV2TagJpg),
        ("testExtractTypeFromV2TagPng", testExtractTypeFromV2TagPng),
        ("testExtractTypeFromV3TagJpg", testExtractTypeFromV3TagJpg),
        ("testExtractTypeFromV3TagPng", testExtractTypeFromV3TagPng),
    ]
}

extension ID3RecordingDateTimeFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsACompleteRecordingDateTime", testFrameCreationWhenThereIsACompleteRecordingDateTime),
    ]
}

extension ID3RecordingDayMonthFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsADayAndAMonth", testFrameCreationWhenThereIsADayAndAMonth),
        ("testNoFrameCreationWhenIsMajorThanVersion3", testNoFrameCreationWhenIsMajorThanVersion3),
        ("testNoFrameCreationWhenThereIsNoDay", testNoFrameCreationWhenThereIsNoDay),
        ("testNoFrameCreationWhenThereIsNoMonth", testNoFrameCreationWhenThereIsNoMonth),
    ]
}

extension ID3RecordingTimeFrameContentParsingOperationTest {
    static let __allTests = [
        ("testframeContentValidTimestamp", testframeContentValidTimestamp),
        ("testframeContentWithYearInsteadOfTimestamp", testframeContentWithYearInsteadOfTimestamp),
    ]
}

extension ID3RecordingYearFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnYear", testFrameCreationWhenThereIsAnYear),
        ("testNoFrameCreationWhenIsMajorThanVersion3", testNoFrameCreationWhenIsMajorThanVersion3),
        ("testNoFrameCreationWhenThereIsNoYear", testNoFrameCreationWhenThereIsNoYear),
    ]
}

extension ID3TagCreatorTest {
    static let __allTests = [
        ("testGenerateValidData", testGenerateValidData),
        ("testNoValidFrameData", testNoValidFrameData),
        ("testTagTooBig", testTagTooBig),
    ]
}

extension ID3TagPresenceTest {
    static let __allTests = [
        ("testHeaderVersion2IsPresent", testHeaderVersion2IsPresent),
        ("testHeaderVersion3IsPresent", testHeaderVersion3IsPresent),
        ("testTagNotPresent", testTagNotPresent),
        ("testTagNotPresentSizeTooSmall", testTagNotPresentSizeTooSmall),
    ]
}

extension ID3TimestampCreatorTest {
    static let __allTests = [
        ("testCreateTimestampCorrectly", testCreateTimestampCorrectly),
        ("testNilDay", testNilDay),
        ("testNilHour", testNilHour),
        ("testNilMinute", testNilMinute),
        ("testNilMonth", testNilMonth),
        ("testNilYear", testNilYear),
    ]
}

extension ID3TitleFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsATitle", testFrameCreationWhenThereIsATitle),
        ("testNoFrameCreationWhenThereIsNoTitle", testNoFrameCreationWhenThereIsNoTitle),
    ]
}

extension ID3ComposerFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAComposer", testFrameCreationWhenThereIsAComposer),
        ("testNoFrameCreationWhenThereIsNoComposer", testNoFrameCreationWhenThereIsNoComposer),
    ]
}

extension ID3ConductorFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAConductor", testFrameCreationWhenThereIsAConductor),
        ("testNoFrameCreationWhenThereIsNoConductor", testNoFrameCreationWhenThereIsNoConductor),
    ]
}

extension ID3ContentGroupingFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAContentGrouping", testFrameCreationWhenThereIsAContentGrouping),
        ("testNoFrameCreationWhenThereIsNoContentGrouping", testNoFrameCreationWhenThereIsNoContentGrouping),
    ]
}

extension ID3CopyrightFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsACopyright", testFrameCreationWhenThereIsACopyright),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoCopyright),
    ]
}

extension ID3EncodedByFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnEncodedBy", testFrameCreationWhenThereIsAnEncodedBy),
        ("testNoFrameCreationWhenThereIsNoEncodedBy", testNoFrameCreationWhenThereIsNoEncodedBy),
    ]
}

extension ID3EncoderSettingsFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereAreEncoderSettings", testFrameCreationWhenThereAreEncoderSettings),
        ("testNoFrameCreationWhenThereAreNoEncoderSettings", testNoFrameCreationWhenThereAreNoEncoderSettings),
    ]
}

extension ID3FileOwnerFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAFileOwner", testFrameCreationWhenThereIsAFileOwner),
        ("testNoFrameCreationWhenThereIsNoFileOwner", testNoFrameCreationWhenThereIsNoFileOwner),
    ]
}

extension ID3FileTypeFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAFileType", testFrameCreationWhenThereIsAFileType),
        ("testNoFrameCreationWhenThereIsNoFileType", testNoFrameCreationWhenThereIsNoFileType),
    ]
}

extension ID3iTunesGroupingFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAGrouping", testFrameCreationWhenThereIsAGrouping),
        ("testNoFrameCreationWhenThereIsNoGrouping", testNoFrameCreationWhenThereIsNoGrouping),
    ]
}

extension ID3LyricistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsALyricist", testFrameCreationWhenThereIsALyricist),
        ("testNoFrameCreationWhenThereIsNoLyricist", testNoFrameCreationWhenThereIsNoLyricist),
    ]
}

extension ID3MediaTypeFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMediaType", testFrameCreationWhenThereIsAMediaType),
        ("testNoFrameCreationWhenThereIsNoMediaType", testNoFrameCreationWhenThereIsNoMediaType),
    ]
}

extension ID3MixArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMixArtist", testFrameCreationWhenThereIsAMixArtist),
        ("testNoFrameCreationWhenThereIsNoMixArtist", testNoFrameCreationWhenThereIsNoMixArtist),
    ]
}

extension ID3ItunesMovementNameFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementName", testFrameCreationWhenThereIsAMovementName),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoMovementName),
    ]
}

extension ID3PodcastCategoryFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastCategory", testFrameCreationWhenThereIsAPodcastCategory),
        ("testNoFrameCreationWhenThereIsNoPodcastCategory", testNoFrameCreationWhenThereIsNoPodcastCategory),
    ]
}

extension ID3PodcastDescriptionFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastDescription", testFrameCreationWhenThereIsAPodcastDescription),
        ("testNoFrameCreationWhenThereIsNoPodcastDescription", testNoFrameCreationWhenThereIsNoPodcastDescription),
    ]
}

extension ID3PodcastIDFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastID", testFrameCreationWhenThereIsAPodcastID),
        ("testNoFrameCreationWhenThereIsNoPodcastID", testNoFrameCreationWhenThereIsNoPodcastID),
    ]
}

extension ID3PodcastKeywordsFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereArePodcastKeywords", testFrameCreationWhenThereArePodcastKeywords),
        ("testNoFrameCreationWhenThereAreNoPodcastKeywords", testNoFrameCreationWhenThereAreNoPodcastKeywords),
    ]
}

extension ID3PublisherFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPublisher", testFrameCreationWhenThereIsAPublisher),
        ("testNoFrameCreationWhenThereIsNoPublisher", testNoFrameCreationWhenThereIsNoPublisher),
    ]
}

extension ID3SubtitleFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASubtitle", testFrameCreationWhenThereIsASubtitle),
        ("testNoFrameCreationWhenThereIsNoSubtitle", testNoFrameCreationWhenThereIsNoSubtitle),
    ]
}

extension ID3UnsyncedLyricsFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereAreUnsyncedLyrics", testFrameCreationWhenThereAreUnsyncedLyrics),
        ("testNoFrameCreationWhenThereAreNoUnsyncedLyrics", testNoFrameCreationWhenThereAreNoUnsyncedLyrics),
    ]
}

extension ID3TrackPositionCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsATrackPosition", testFrameCreationWhenThereIsATrackPosition),
        ("testNoFrameCreationWhenThereIsNoTrackPosition", testNoFrameCreationWhenThereIsNoTrackPosition),
    ]
}

extension ID3DiscPositionCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsADiscPosition", testFrameCreationWhenThereIsADiscPosition),
        ("testNoFrameCreationWhenThereIsNoDiscPosition", testNoFrameCreationWhenThereIsNoDiscPosition),
    ]
}

extension ID3ItunesMovementIndexCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementIndex", testFrameCreationWhenThereIsAMovementIndex),
        ("testNoFrameCreationWhenThereIsNoMovementIndex", testNoFrameCreationWhenThereIsNoMovementIndex),
    ]
}

extension ID3ItunesMovementCountCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementCount", testFrameCreationWhenThereIsAMovementCount),
        ("testNoFrameCreationWhenThereIsNoMovementCount", testNoFrameCreationWhenThereIsNoMovementCount),
    ]
}
extension ID3UserDefinedTextInformationCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsUserDefinedText", testFrameCreationWhenThereIsUserDefinedText),
        ("testNoFrameCreationWhenThereIsNoUserDefinedText", testNoFrameCreationWhenThereIsNoUserDefinedText),
    ]
}

extension ID3TrackPositionStringAdapterTest {
    static let __allTests = [
        ("testAdaptNotANumberTrackPosition", testAdaptNotANumberTrackPosition),
        ("testAdaptTrackPositionWithoutTotalTracks", testAdaptTrackPositionWithoutTotalTracks),
        ("testAdaptTrackPositionWithTotalTrack", testAdaptTrackPositionWithTotalTrack),
    ]
}

extension ID3DiscPositionStringAdapterTest {
    static let __allTests = [
        ("testAdaptNotANumberDiscPosition", testAdaptNotANumberDiscPosition),
        ("testAdaptDiscPositionWithoutTotalDiscs", testAdaptDiscPositionWithoutTotalDiscs),
        ("testAdaptDiscPositionWithTotalDiscs", testAdaptDiscPositionWithTotalDiscs),
    ]
}

extension ID3UTF16StringToByteAdapterTest {
    static let __allTests = [
        ("testEncodeStringToUTF16WithEncodingByte", testEncodeStringToUTF16WithEncodingByte),
    ]
}

extension PaddingAdderUsingNullCharTest {
    static let __allTests = [
        ("testAddPadding", testAddPadding),
    ]
}

extension PaddingRemoverUsingTrimmingTest {
    static let __allTests = [
        ("testRemovePadding", testRemovePadding),
    ]
}

extension UInt32ToByteArrayAdapterUsingUnsafePointerTest {
    static let __allTests = [
        ("testAdapt32BitUnsignedInteger", testAdapt32BitUnsignedInteger),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ID3AlbumArtistFrameCreatorTest.__allTests),
        testCase(ID3AlbumFrameCreatorTest.__allTests),
        testCase(ID3ArtistFrameCreatorTest.__allTests),
        testCase(ID3ComposerFrameCreatorTest.__allTests),
        testCase(ID3ConductorFrameCreatorTest.__allTests),
        testCase(ID3ContentGroupingFrameCreatorTest.__allTests),
        testCase(ID3CopyrightFrameCreatorTest.__allTests),
        testCase(ID3DiscPositionFrameCreatorTest.__allTests),
        testCase(ID3EncodedByFrameCreatorTest.__allTests),
        testCase(ID3EncoderSettingsFrameCreatorTest.__allTests),
        testCase(ID3FileTypeFrameCreatorTest.__allTests),
        testCase(ID3FileOwnerFrameCreatorTest.__allTests),
        testCase(ID3iTunesGroupingFrameCreatorTest.__allTests),
        testCase(ID3LyricistFrameCreatorTest.__allTests),
        testCase(ID3MediaTypeFrameCreatorTest.__allTests),
        testCase(ID3MixArtistFrameCreatorTest.__allTests),
        testCase(ID3ItunesMovementIndexFrameCreatorTest.__allTests),
        testCase(ID3ItunesMovementNameFrameCreatorTest.__allTests),
        testCase(ID3PodcastCategoryFrameCreatorTest.__allTests),
        testCase(ID3PodcastDescriptionFrameCreatorTest.__allTests),
        testCase(ID3PodcastIDFrameCreatorTest.__allTests),
        testCase(ID3PodcastKeywordsFrameCreatorTest.__allTests),
        testCase(ID3PublisherFrameCreatorTest.__allTests),
        testCase(ID3SubtitleFrameCreatorTest.__allTests),
        testCase(ID3UnsyncedLyricsFrameCreatorTest.__allTests),
        testCase(ID3DiscPositionFrameCreatorTest.__allTests),
        testCase(ID3UserDefinedTextInformationFrameCreatorTest.__allTests),
        testCase(ID3AttachedPictureFrameContentParsingOperationTest.__allTests),
        testCase(ID3AttachedPicturesFramesCreatorTest.__allTests),
        testCase(ID3FrameConfigurationTest.__allTests),
        testCase(ID3FrameContentSizeCalculatorTest.__allTests),
        testCase(ID3FrameCreatorsChainTest.__allTests),
        testCase(ID3FrameFlagsCreatorTest.__allTests),
        testCase(ID3FrameFromStringContentCreatorTest.__allTests),
        testCase(ID3GenreFrameCreatorTest.__allTests),
        testCase(ID3GenreStringAdapterTest.__allTests),
        testCase(ID3ISO88591StringToByteAdapterTest.__allTests),
        testCase(ID3PictureTypeAdapterTest.__allTests),
        testCase(ID3RecordingDateTimeFrameCreatorTest.__allTests),
        testCase(ID3RecordingDayMonthFrameCreatorTest.__allTests),
        testCase(ID3RecordingTimeFrameContentParsingOperationTest.__allTests),
        testCase(ID3RecordingYearFrameCreatorTest.__allTests),
        testCase(ID3TagCreatorTest.__allTests),
        testCase(ID3TagPresenceTest.__allTests),
        testCase(ID3TimestampCreatorTest.__allTests),
        testCase(ID3TitleFrameCreatorTest.__allTests),
        testCase(ID3TrackPositionCreatorTest.__allTests),
        testCase(ID3TrackPositionStringAdapterTest.__allTests),
        testCase(ID3DiscPositionCreatorTest.__allTests),
        testCase(ID3DiscPositionStringAdapterTest.__allTests),
        testCase(ID3ItunesMovementIndexCreatorTest.__allTests),
        testCase(ID3ItunesMovementCountCreatorTest.__allTests),
        testCase(ID3UserDefinedTextInformationCreatorTest.__allTests),
        testCase(ID3UTF16StringToByteAdapterTest.__allTests),
        testCase(PaddingAdderUsingNullCharTest.__allTests),
        testCase(PaddingRemoverUsingTrimmingTest.__allTests),
        testCase(UInt32ToByteArrayAdapterUsingUnsafePointerTest.__allTests),
    ]
}
#endif
