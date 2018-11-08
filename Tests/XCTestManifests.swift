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

extension ID3TrackPositionCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsATrackPosition", testFrameCreationWhenThereIsATrackPosition),
        ("testNoFrameCreationWhenThereIsNoTrackPosition", testNoFrameCreationWhenThereIsNoTrackPosition),
    ]
}

extension ID3TrackPositionStringAdapterTest {
    static let __allTests = [
        ("testAdaptNotANumberTrackPosition", testAdaptNotANumberTrackPosition),
        ("testAdaptTrackPositionWithoutTotalTracks", testAdaptTrackPositionWithoutTotalTracks),
        ("testAdaptTrackPositionWithTotalTrack", testAdaptTrackPositionWithTotalTrack),
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
        testCase(ID3UTF16StringToByteAdapterTest.__allTests),
        testCase(PaddingAdderUsingNullCharTest.__allTests),
        testCase(PaddingRemoverUsingTrimmingTest.__allTests),
        testCase(UInt32ToByteArrayAdapterUsingUnsafePointerTest.__allTests),
    ]
}
#endif
