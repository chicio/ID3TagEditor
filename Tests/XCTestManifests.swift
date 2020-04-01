import XCTest

// MARK: A-B
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

extension ID3ArrangerFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnArranger", testFrameCreationWhenThereIsAnArranger),
        ("testNoFrameCreationWhenThereIsNoArranger", testNoFrameCreationWhenThereIsNoArranger),
    ]
}

extension ID3ArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnArtist", testFrameCreationWhenThereIsAnArtist),
        ("testNoFrameCreationWhenThereIsNoArtist", testNoFrameCreationWhenThereIsNoArtist),
    ]
}

extension ID3ArtistUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnArtistUrl", testFrameCreationWhenThereIsAnArtistUrl),
        ("testNoFrameCreationWhenThereIsNoArtistUrl", testNoFrameCreationWhenThereIsNoArtistUrl),
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

extension ID3AudioSourceUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnAudioSourceUrl", testFrameCreationWhenThereIsAnAudioSourceUrl),
        ("testNoFrameCreationWhenThereIsNoAudioSourceUrl", testNoFrameCreationWhenThereIsNoAudioSourceUrl),
    ]
}

extension ID3AudioFileUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnAudioFileUrl", testFrameCreationWhenThereIsAnAudioFileUrl),
        ("testNoFrameCreationWhenThereIsNoAudioFileUrl", testNoFrameCreationWhenThereIsNoAudioFileUrl),
    ]
}

extension ID3BPMFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsABPM", testFrameCreationWhenThereIsABPM),
        ("testNoFrameCreationWhenThereIsNoBPM", testNoFrameCreationWhenThereIsNoBPM),
    ]
}

// MARK: C-D
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

extension ID3ContentGroupFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAContentGroup", testFrameCreationWhenThereIsAContentGroup),
        ("testNoFrameCreationWhenThereIsNoContentGroup", testNoFrameCreationWhenThereIsNoContentGroup),
    ]
}

extension ID3CopyrightFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsACopyright", testFrameCreationWhenThereIsACopyright),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoCopyright),
    ]
}

extension ID3CopyrightUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsACopyrightUrl", testFrameCreationWhenThereIsACopyrightUrl),
        ("testNoFrameCreationWhenThereIsNoCopyrightUrl", testNoFrameCreationWhenThereIsNoCopyrightUrl),
    ]
}

extension ID3DiscPositionFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsADiscPosition", testFrameCreationWhenThereIsADiscPosition),
        ("testNoFrameCreationWhenThereIsNoDiscPosition", testNoFrameCreationWhenThereIsNoDiscPosition),
    ]
}

extension ID3DiscPositionStringAdapterTest {
    static let __allTests = [
        ("testAdaptNotANumberDiscPosition", testAdaptNotANumberDiscPosition),
        ("testAdaptDiscPositionWithoutTotalDiscs", testAdaptDiscPositionWithoutTotalDiscs),
        ("testAdaptDiscPositionWithTotalDiscs", testAdaptDiscPositionWithTotalDiscs),
    ]
}

// MARK: E-F
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

// MARK: G-L
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

extension ID3InitialKeyFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnInitialKey", testFrameCreationWhenThereIsAnInitialKey),
        ("testNoFrameCreationWhenThereIsNoInitialKey", testNoFrameCreationWhenThereIsNoInitialKey),
    ]
}

extension ID3ISO88591StringToByteAdapterTest {
    static let __allTests = [
        ("testEncodeStringToISO88591WithEncodingByte", testEncodeStringToISO88591WithEncodingByte),
    ]
}

extension ID3ISRCFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnISRC", testFrameCreationWhenThereIsAnISRC),
        ("testNoFrameCreationWhenThereIsNoISRC", testNoFrameCreationWhenThereIsNoISRC),
    ]
}

extension ID3ITunesCompilationFlagFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenCompilationFlagIsSet", testFrameCreationWhenCompilationFlagIsSet),
        ("testNoFrameCreationWhenCompilationFlagIsNotSet", testFrameCreationWhenCompilationFlagIsNotSet),
    ]
}

extension ID3iTunesGroupingFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAGrouping", testFrameCreationWhenThereIsAGrouping),
        ("testNoFrameCreationWhenThereIsNoGrouping", testNoFrameCreationWhenThereIsNoGrouping),
    ]
}


extension ID3ItunesMovementNameFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMovementName", testFrameCreationWhenThereIsAMovementName),
        ("testNoFrameCreationWhenThereIsNoCopyright", testNoFrameCreationWhenThereIsNoMovementName),
    ]
}

extension ID3LanguageFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsALanguage", testFrameCreationWhenThereIsALanguage),
        ("testNoFrameCreationWhenThereIsNoLanguage", testNoFrameCreationWhenThereIsNoLanguage),
    ]
}

extension ID3LengthFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsALength", testFrameCreationWhenThereIsALength),
        ("testNoFrameCreationWhenThereIsNoLength", testNoFrameCreationWhenThereIsNoLength),
    ]
}


extension ID3LyricistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsALyricist", testFrameCreationWhenThereIsALyricist),
        ("testNoFrameCreationWhenThereIsNoLyricist", testNoFrameCreationWhenThereIsNoLyricist),
    ]
}

// MARK: M-P
extension ID3MediaTypeFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMediaType", testFrameCreationWhenThereIsAMediaType),
        ("testNoFrameCreationWhenThereIsNoMediaType", testNoFrameCreationWhenThereIsNoMediaType),
    ]
}

extension ID3MoodFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAMood", testFrameCreationWhenThereIsAMood),
        ("testNoFrameCreationWhenThereIsNoMood", testNoFrameCreationWhenThereIsNoMood),
    ]
}

extension ID3OriginalAlbumFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnOriginalAlbum", testFrameCreationWhenThereIsAnOriginalAlbum),
        ("testNoFrameCreationWhenThereIsNoOriginalAlbum", testNoFrameCreationWhenThereIsNoOriginalAlbum),
    ]
}

extension ID3OriginalArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnOriginalArtist", testFrameCreationWhenThereIsAnOriginalArtist),
        ("testNoFrameCreationWhenThereIsNoOriginalArtist", testNoFrameCreationWhenThereIsNoOriginalArtist),
    ]
}

extension ID3OriginalFilenameFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnOriginalFilename", testFrameCreationWhenThereIsAnOriginalFilename),
        ("testNoFrameCreationWhenThereIsNoOriginalFilename", testNoFrameCreationWhenThereIsNoOriginalFilename),
    ]
}

extension ID3OriginalLyricistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAnOriginalLyricist", testFrameCreationWhenThereIsAnOriginalLyricist),
        ("testNoFrameCreationWhenThereIsNoOriginalLyricist", testNoFrameCreationWhenThereIsNoOriginalLyricist),
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

extension ID3PictureTypeAdapterTest {
    static let __allTests = [
        ("testExtractTypeFromV2TagJpg", testExtractTypeFromV2TagJpg),
        ("testExtractTypeFromV2TagPng", testExtractTypeFromV2TagPng),
        ("testExtractTypeFromV3TagJpg", testExtractTypeFromV3TagJpg),
        ("testExtractTypeFromV3TagPng", testExtractTypeFromV3TagPng),
    ]
}

extension ID3PlaylistDelayFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPlaylistDelay", testFrameCreationWhenThereIsAPlaylistDelay),
        ("testNoFrameCreationWhenThereIsNoPlaylistDelay", testNoFrameCreationWhenThereIsNoPlaylistDelay),
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

extension ID3PodcastFlagFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenPodcastFlagIsSet", testFrameCreationWhenPodcastFlagIsSet),
        ("testFrameCreationWhenPodcastFlagIsNotSet", testFrameCreationWhenPodcastFlagIsNotSet),
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

extension ID3PodcastUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPodcastUrl", testFrameCreationWhenThereIsAPodcastUrl),
        ("testNoFrameCreationWhenThereIsNoPodcastUrl", testNoFrameCreationWhenThereIsNoPodcastUrl),
    ]
}

extension ID3PublisherFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPublisher", testFrameCreationWhenThereIsAPublisher),
        ("testNoFrameCreationWhenThereIsNoPublisher", testNoFrameCreationWhenThereIsNoPublisher),
    ]
}

extension ID3PublisherUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAPublisherUrl", testFrameCreationWhenThereIsAPublisherUrl),
        ("testNoFrameCreationWhenThereIsNoPublisherUrl", testNoFrameCreationWhenThereIsNoPublisherUrl),
    ]
}

// MARK: Q-S
extension ID3RadioStationFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsARadioStation", testFrameCreationWhenThereIsARadioStation),
        ("testNoFrameCreationWhenThereIsNoRadioStation", testNoFrameCreationWhenThereIsNoRadioStation),
    ]
}

extension ID3RadioStationOwnerFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsARadioStationOwner", testFrameCreationWhenThereIsARadioStationOwner),
        ("testNoFrameCreationWhenThereIsNoRadioStationOwner", testNoFrameCreationWhenThereIsNoRadioStationOwner),
    ]
}

extension ID3RadioStationUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsARadioStationUrl", testFrameCreationWhenThereIsARadioStationUrl),
        ("testNoFrameCreationWhenThereIsNoRadioStationUrl", testNoFrameCreationWhenThereIsNoRadioStationUrl),
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

extension ID3SetSubtitleFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASetSubtitle", testFrameCreationWhenThereIsASetSubtitle),
        ("testNoFrameCreationWhenThereIsNoSetSubtitle", testNoFrameCreationWhenThereIsNoSetSubtitle),
    ]
}

extension ID3SortAlbumFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASortAlbum", testFrameCreationWhenThereIsASortAlbum),
        ("testNoFrameCreationWhenThereIsNoSortAlbum", testNoFrameCreationWhenThereIsNoSortAlbum),
    ]
}

extension ID3SortAlbumArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASortAlbumArtist", testFrameCreationWhenThereIsASortAlbumArtist),
        ("testNoFrameCreationWhenThereIsNoSortAlbumArtist", testNoFrameCreationWhenThereIsNoSortAlbumArtist),
    ]
}

extension ID3SortArtistFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASortArtist", testFrameCreationWhenThereIsASortArtist),
        ("testNoFrameCreationWhenThereIsNoSortArtist", testNoFrameCreationWhenThereIsNoSortArtist),
    ]
}

extension ID3SortComposerFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASortComposer", testFrameCreationWhenThereIsASortComposer),
        ("testNoFrameCreationWhenThereIsNoSortComposer", testNoFrameCreationWhenThereIsNoSortComposer),
    ]
}

extension ID3SortTitleFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASortTitle", testFrameCreationWhenThereIsASortTitle),
        ("testNoFrameCreationWhenThereIsNoSortTitle", testNoFrameCreationWhenThereIsNoSortTitle),
    ]
}

extension ID3SubtitleFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsASubtitle", testFrameCreationWhenThereIsASubtitle),
        ("testNoFrameCreationWhenThereIsNoSubtitle", testNoFrameCreationWhenThereIsNoSubtitle),
    ]
}

// MARK: T-Z

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

extension ID3TrackPositionFrameCreatorTest {
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

extension UInt32ToByteArrayAdapterUsingUnsafePointerTest {
    static let __allTests = [
        ("testAdapt32BitUnsignedInteger", testAdapt32BitUnsignedInteger),
    ]
}

extension ID3UnsyncedLyricsFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereAreUnsyncedLyrics", testFrameCreationWhenThereAreUnsyncedLyrics),
        ("testNoFrameCreationWhenThereAreNoUnsyncedLyrics", testNoFrameCreationWhenThereAreNoUnsyncedLyrics),
    ]
}

extension ID3UserDefinedUrlFrameCreatorTest {
    static let __allTests = [
        ("testFrameCreationWhenThereIsAUserDefinedUrl", testFrameCreationWhenThereIsAUserDefinedUrl),
        ("testNoFrameCreationWhenThereIsNoUserDefinedUrl", testNoFrameCreationWhenThereIsNoUserDefinedUrl),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ID3AlbumArtistFrameCreatorTest.__allTests),
        testCase(ID3AlbumFrameCreatorTest.__allTests),
        testCase(ID3ArrangerFrameCreatorTest.__allTests),
        testCase(ID3ArtistFrameCreatorTest.__allTests),
        testCase(ID3ArtistUrlFrameCreatorTest.__allTests),
        testCase(ID3AttachedPicturesFramesCreatorTest.__allTests),
        testCase(ID3AudioFileUrlFramesCreatorTest.__allTests),
        testCase(ID3AudioSourceUrlFramesCreatorTest.__allTests),
        testCase(ID3BPMFrameCreatorTest.__allTests),
        testCase(ID3CommentFrameCreatorTest.__allTests),
        testCase(ID3ComposerFrameCreatorTest.__allTests),
        testCase(ID3ConductorFrameCreatorTest.__allTests),
        testCase(ID3ContentGroupFrameCreatorTest.__allTests),
        testCase(ID3CopyrightFrameCreatorTest.__allTests),
        testCase(ID3CopyrightUrlFrameCreatorTest.__allTests),
        testCase(ID3DiscPositionFrameCreatorTest.__allTests),
        testCase(ID3EncodedByFrameCreatorTest.__allTests),
        testCase(ID3EncoderSettingsFrameCreatorTest.__allTests),
        testCase(ID3FileOwnerFrameCreatorTest.__allTests),
        testCase(ID3FileTypeFrameCreatorTest.__allTests),
        testCase(ID3GenreFrameCreatorTest.__allTests),
        testCase(ID3InitialKeyFrameCreatorTest.__allTests),
        testCase(ID3ITunesCompilationFlagFrameCreatorTest.__allTests),
        testCase(ID3iTunesGroupingFrameCreatorTest.__allTests),
        testCase(ID3ItunesMovementCountFrameCreatorTest.__allTests),
        testCase(ID3ItunesMovementIndexFrameCreatorTest.__allTests),
        testCase(ID3ItunesMovementNameFrameCreatorTest.__allTests),
        testCase(ID3LanguageFrameCreatorTest.__allTests),
        testCase(ID3LyricistFrameCreatorTest.__allTests),
        testCase(ID3LengthFrameCreatorTest.__allTests),
        testCase(ID3MediaTypeFrameCreatorTest.__allTests),
        testCase(ID3MoodFrameCreatorTest.__allTests),
        testCase(ID3OriginalAlbumFrameCreatorTest.__allTests),
        testCase(ID3OriginalArtistFrameCreatorTest.__allTests),
        testCase(ID3OriginalFilenameFrameCreatorTest.__allTests),
        testCase(ID3OriginalLyricistFrameCreatorTest.__allTests),
        testCase(ID3PlaylistDelayFrameCreatorTest.__allTests),
        testCase(ID3PodcastCategoryFrameCreatorTest.__allTests),
        testCase(ID3PodcastDescriptionFrameCreatorTest.__allTests),
        testCase(ID3PodcastFlagFrameCreatorTest.__allTests),
        testCase(ID3PodcastIDFrameCreatorTest.__allTests),
        testCase(ID3PodcastKeywordsFrameCreatorTest.__allTests),
        testCase(ID3PublisherFrameCreatorTest.__allTests),
        testCase(ID3PublisherUrlFrameCreatorTest.__allTests),
        testCase(ID3RadioStationFrameCreatorTest.__allTests),
        testCase(ID3RadioStationOwnerFrameCreatorTest.__allTests),
        testCase(ID3RadioStationUrlFrameCreatorTest.__allTests),
        testCase(ID3SetSubtitleFrameCreatorTest.__allTests),
        testCase(ID3SortAlbumFrameCreatorTest.__allTests),
        testCase(ID3SortAlbumArtistFrameCreatorTest.__allTests),
        testCase(ID3SortArtistFrameCreatorTest.__allTests),
        testCase(ID3SortComposerFrameCreatorTest.__allTests),
        testCase(ID3SortTitleFrameCreatorTest.__allTests),
        testCase(ID3SubtitleFrameCreatorTest.__allTests),
        testCase(ID3TitleFrameCreatorTest.__allTests),
        testCase(ID3TrackPositionFrameCreatorTest.__allTests),
        testCase(ID3UnsyncedLyricsFrameCreatorTest.__allTests),
        testCase(ID3UserDefinedTextInformationFrameCreatorTest.__allTests),
        testCase(ID3AttachedPictureFrameContentParsingOperationTest.__allTests),
        testCase(ID3FrameConfigurationTest.__allTests),
        testCase(ID3FrameContentSizeCalculatorTest.__allTests),
        testCase(ID3FrameCreatorsChainTest.__allTests),
        testCase(ID3FrameFlagsCreatorTest.__allTests),
        testCase(ID3FrameFromStringContentCreatorTest.__allTests),
        testCase(ID3FrameFromURLStringContentCreatorTest).__allTests,
        testCast(ID3CommentTypesFrameCreatorTest).__allTests,
        testCase(ID3GenreStringAdapterTest.__allTests),
        testCase(ID3CommentTypesStringAdapterTest.__allTests),
        testCase(ID3ISO88591StringToByteAdapterTest.__allTests),
        testCase(ID3PictureTypeAdapterTest.__allTests),
        testCase(ID3RecordingDateTimeFrameCreatorTest.__allTests),
        testCase(ID3RecordingDayMonthFrameCreatorTest.__allTests),
        testCase(ID3RecordingTimeFrameContentParsingOperationTest.__allTests),
        testCase(ID3RecordingYearFrameCreatorTest.__allTests),
        testCase(ID3TagCreatorTest.__allTests),
        testCase(ID3TagPresenceTest.__allTests),
        testCase(ID3TimestampCreatorTest.__allTests),
        testCase(ID3TrackPositionStringAdapterTest.__allTests),
        testCase(ID3DiscPositionStringAdapterTest.__allTests),
        testCase(ID3UserDefinedTextInformationCreatorTest.__allTests),
        testCase(ID3UTF16StringToByteAdapterTest.__allTests),
        testCase(PaddingAdderUsingNullCharTest.__allTests),
        testCase(PaddingRemoverUsingTrimmingTest.__allTests),
        testCase(UInt32ToByteArrayAdapterUsingUnsafePointerTest.__allTests),
    ]
}
#endif
