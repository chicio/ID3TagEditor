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

extension ID3MixArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMixArtist", testFrameCreationWhenThereIsAMixArtist),
        ("testNoFrameCreationWhenThereIsNoMixArtist", testNoFrameCreationWhenThereIsNoMixArtist),
    ]
}

extension ID3iTunesMovementNameFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementName", testFrameCreationWhenThereIsAMovementName),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoMovementName),
    ]
}

extension ID3iTunesPodcastCategoryFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastCategory", testFrameCreationWhenThereIsAPodcastCategory),
        ("testNoFrameCreationWhenThereIsNoPodcastCategory", testNoFrameCreationWhenThereIsNoPodcastCategory),
    ]
}

extension ID3iTunesPodcastDescriptionFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastDescription", testFrameCreationWhenThereIsAPodcastDescription),
        ("testNoFrameCreationWhenThereIsNoPodcastDescription", testNoFrameCreationWhenThereIsNoPodcastDescription),
    ]
}

extension ID3iTunesPodcastIDFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastID", testFrameCreationWhenThereIsAPodcastID),
        ("testNoFrameCreationWhenThereIsNoPodcastID", testNoFrameCreationWhenThereIsNoPodcastID),
    ]
}

extension ID3iTunesPodcastKeywordsFrameCreatorTest {
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

extension ID3TrackPositionCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsATrackPosition", testFrameCreationWhenThereIsATrackPosition),
        ("testNoFrameCreationWhenThereIsNoTrackPosition", testNoFrameCreationWhenThereIsNoTrackPosition),
    ]
}

extension ID3DiscPositionFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsADiscPosition", testFrameCreationWhenThereIsADiscPosition),
        ("testNoFrameCreationWhenThereIsNoDiscPosition", testNoFrameCreationWhenThereIsNoDiscPosition),
    ]
}

extension ID3iTunesMovementIndexFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementIndex", testFrameCreationWhenThereIsAMovementIndex),
        ("testNoFrameCreationWhenThereIsNoMovementIndex", testNoFrameCreationWhenThereIsNoMovementIndex),
    ]
}

extension ID3iTunesMovementCountFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementCount", testFrameCreationWhenThereIsAMovementCount),
        ("testNoFrameCreationWhenThereIsNoMovementCount", testNoFrameCreationWhenThereIsNoMovementCount),
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

extension ID3FrameContentSizeParserTest {
    static let __allTests = [
        ("testParseFrameContentSizeV2", testParseFrameContentSizeV2),
        ("testParseFrameContentSizeV3", testParseFrameContentSizeV3),
        ("testParseFrameContentSizeV4", testParseFrameContentSizeV4),
    ]
}

extension ID3StringContentParsingOperationTest {
    static let __allTests = [
        ("testFrameContentParsedV2", testFrameContentParsedV2),
        ("testFrameContentParsedV3", testFrameContentParsedV3),
        ("testFrameContentParsedV2utf16", testFrameContentParsedV2utf16),
        ("testFrameContentParsedV3utf16", testFrameContentParsedV3utf16),
        ("testFrameContentParsedV4utf8", testFrameContentParsedV4utf8),
    ]
}

extension ID3FrameSizeParserTest {
    static let __allTests = [
        ("testParseFrameContentSizeV2", testParseFrameContentSizeV2),
        ("testParseFrameContentSizeV3", testParseFrameContentSizeV3),
    ]
}

extension ID3TagSizeParserTest {
    static let __allTests = [
        ("testParseTagSizeV2", testParseTagSizeV2),
        ("testParseFrameContentSizeV3", testParseTagSizeV3),
    ]
}

extension Mp3FileReaderTest {
    static let __allTests = [
        ("testNotAnMp3file", testNotAnMp3file),
        ("testMp3File", testMp3File),
    ]
}

extension ID3TagEditorTestAcceptanceTest {
    static let __allTests = [
        ("testFailWrongFilePathFilePath", testFailWrongFilePathFilePath),
        ("testReadTagV2", testReadTagV2),
        ("testParseTagV3", testParseTagV3),
        ("testParseTagV3AdditionalData", testParseTagV3AdditionalData),
        ("testReadTagV4", testReadTagV4),
        ("testReadTagV4WithImage", testReadTagV4WithImage),
        ("testReadAsMp3", testReadAsMp3),
        ("testReadInvalidFile", testReadInvalidFile),
        ("testReadUtf16String", testReadUtf16String),
        ("testWriteTagV2", testWriteTagV2),
        ("testWriteTagV3WhenItAlreadyExists", testWriteTagV3WhenItAlreadyExists),
        ("testWriteTagV3WithJpg", testWriteTagV3WithJpg),
        ("testWriteTagV3WithPng", testWriteTagV3WithPng),
        ("testWriteTagV3WithCustomPathThatDoesNotExists", testWriteTagV3WithCustomPathThatDoesNotExists),
        ("testWriteTagV3WithSamePath", testWriteTagV3WithSamePath),
        ("testWriteTagV3WithAdditionalData", testWriteTagV3WithAdditionalData),
        ("testWriteTagV3ToMp3AsData", testWriteTagV3ToMp3AsData),
        ("testWriteTagV4", testWriteTagV4),
        ("testWriteTagV4WithPng", testWriteTagV4WithPng),

    ]
}

#if os(Linux)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ID3AlbumArtistFrameCreatorTest.__allTests),
        testCase(ID3AlbumFrameCreatorTest.__allTests),
        testCase(ID3ArtistFrameCreatorTest.__allTests),
        testCase(ID3ComposerFrameCreatorTest.__allTests),
        testCase(ID3ConductorFrameCreatorTest.__allTests),
        testCase(ID3ContentGroupingFrameCreatorTest.__allTests),
        testCase(ID3CopyrightFrameCreatorTest.__allTests),
        testCase(ID3EncodedByFrameCreatorTest.__allTests),
        testCase(ID3EncoderSettingsFrameCreatorTest.__allTests),
        testCase(ID3FileOwnerFrameCreatorTest.__allTests),
        testCase(ID3LyricistFrameCreatorTest.__allTests),
        testCase(ID3MixArtistFrameCreatorTest.__allTests),
        testCase(ID3PublisherFrameCreatorTest.__allTests),
        testCase(ID3SubtitleFrameCreatorTest.__allTests),
        testCase(ID3DiscPositionFrameCreatorTest.__allTests),
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
        testCase(ID3DiscPositionStringAdapterTest.__allTests),
        testCase(ID3UTF16StringToByteAdapterTest.__allTests),
        testCase(PaddingAdderUsingNullCharTest.__allTests),
        testCase(PaddingRemoverUsingTrimmingTest.__allTests),
        testCase(UInt32ToByteArrayAdapterUsingUnsafePointerTest.__allTests),
        testCase(ID3iTunesMovementCountFrameCreatorTest.__allTests),
        testCase(ID3iTunesGroupingFrameCreatorTest.__allTests),
        testCase(ID3iTunesMovementIndexFrameCreatorTest.__allTests),
        testCase(ID3iTunesMovementNameFrameCreatorTest.__allTests),
        testCase(ID3iTunesPodcastCategoryFrameCreatorTest.__allTests),
        testCase(ID3iTunesPodcastIDFrameCreatorTest.__allTests),
        testCase(ID3iTunesPodcastKeywordsFrameCreatorTest.__allTests),
        testCase(ID3iTunesPodcastDescriptionFrameCreatorTest.__allTests),
        testCase(ID3FrameContentSizeParserTest.__allTests),
        testCase(ID3StringContentParsingOperationTest.__allTests),
        testCase(ID3FrameSizeParserTest.__allTests),
        testCase(ID3TagSizeParserTest.__allTests),
        testCase(Mp3FileReaderTest.__allTests),
        testCase(ID3TagEditorTestAcceptanceTest.__allTests),
    ]
}
#endif
