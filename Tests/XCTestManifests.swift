import XCTest

#if os(Linux)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ID3FrameWithStringContentCreatorTest.allTests),
        testCase(ID3FileOwnerFrameCreatorTest.allTests),
        testCase(ID3LyricistFrameCreatorTest.allTests),
        testCase(ID3MixArtistFrameCreatorTest.allTests),
        testCase(ID3PublisherFrameCreatorTest.allTests),
        testCase(ID3DiscPositionFrameCreatorTest.allTests),
        testCase(ID3AttachedPictureFrameContentParsingOperationTest.allTests),
        testCase(ID3AttachedPicturesFramesCreatorTest.allTests),
        testCase(ID3FrameConfigurationTest.allTests),
        testCase(ID3FrameContentSizeCalculatorTest.allTests),
        testCase(ID3FrameFlagsCreatorTest.allTests),
        testCase(ID3FrameFromStringContentCreatorTest.allTests),
        testCase(ID3GenreFrameCreatorTest.allTests),
        testCase(ID3GenreStringAdapterTest.allTests),
        testCase(ID3ISO88591StringToByteAdapterTest.allTests),
        testCase(ID3PictureTypeAdapterTest.allTests),
        testCase(ID3RecordingDateTimeFrameCreatorTest.allTests),
        testCase(ID3RecordingDayMonthFrameCreatorTest.allTests),
        testCase(ID3RecordingTimeFrameContentParsingOperationTest.allTests),
        testCase(ID3RecordingYearFrameCreatorTest.allTests),
        testCase(ID3TagCreatorTest.allTests),
        testCase(ID3TagPresenceTest.allTests),
        testCase(ID3TimestampCreatorTest.allTests),
        testCase(ID3TrackPositionCreatorTest.allTests),
        testCase(ID3TrackPositionStringAdapterTest.allTests),
        testCase(ID3DiscPositionStringAdapterTest.allTests),
        testCase(ID3UTF16StringToByteAdapterTest.allTests),
        testCase(PaddingAdderUsingNullCharTest.allTests),
        testCase(PaddingRemoverUsingTrimmingTest.allTests),
        testCase(UInt32ToByteArrayAdapterUsingUnsafePointerTest.allTests),
        testCase(ID3iTunesMovementCountFrameCreatorTest.allTests),
        testCase(ID3iTunesGroupingFrameCreatorTest.allTests),
        testCase(ID3iTunesMovementIndexFrameCreatorTest.allTests),
        testCase(ID3iTunesMovementNameFrameCreatorTest.allTests),
        testCase(ID3iTunesPodcastCategoryFrameCreatorTest.allTests),
        testCase(ID3iTunesPodcastIDFrameCreatorTest.allTests),
        testCase(ID3iTunesPodcastKeywordsFrameCreatorTest.allTests),
        testCase(ID3iTunesPodcastDescriptionFrameCreatorTest.allTests),
        testCase(ID3FrameContentSizeParserTest.allTests),
        testCase(ID3StringContentParsingOperationTest.allTests),
        testCase(ID3FrameSizeParserTest.allTests),
        testCase(ID3TagSizeParserTest.allTests),
        testCase(Mp3FileReaderTest.allTests),
        testCase(ID3LocalizedFrameCreatorTest.allTests),
        testCase(ID3FramesWithLocalizedContentCreatorTest.allTests),
        testCase(ID3FrameHeaderCreatorTest.allTests),
        testCase(ID3LocalizedFrameParsingOperationTest.allTests),
        testCase(ID3TagEditorAcceptanceTest.allTests),
        testCase(ID3TagEditorWriteReadAcceptanceTest.allTests),
        testCase(ID3TagTest.allTests),
        testCase(ID3TagVersionParserTest.allTests)
    ]
}
#endif
