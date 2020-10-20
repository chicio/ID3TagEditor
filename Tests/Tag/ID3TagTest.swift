//
//  ID3TagTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 20.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable line_length
// swiftlint:disable function_body_length

import XCTest
@testable import ID3TagEditor

class ID3TagTest: XCTestCase {

    func testDebugDescription() throws {
        let artFront = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg"))
        )
        let artBack = try Data(
            contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg"))
        )

        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .title: ID3FrameWithStringContent(content: "title V3"),
                .album: ID3FrameWithStringContent(content: "album V3"),
                .albumArtist: ID3FrameWithStringContent(content: "album artist V3"),
                .artist: ID3FrameWithStringContent(content: "artist V3"),
                .composer: ID3FrameWithStringContent(content: "composer V3"),
                .conductor: ID3FrameWithStringContent(content: "conductor V3"),
                .contentGrouping: ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .copyright: ID3FrameWithStringContent(content: "Copyright V3"),
                .encodedBy: ID3FrameWithStringContent(content: "EncodedBy V3"),
                .encoderSettings: ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .fileOwner: ID3FrameWithStringContent(content: "FileOwner V3"),
                .lyricist: ID3FrameWithStringContent(content: "Lyricist V3"),
                .mixArtist: ID3FrameWithStringContent(content: "MixArtist V3"),
                .publisher: ID3FrameWithStringContent(content: "Publisher V3"),
                .subtitle: ID3FrameWithStringContent(content: "Subtitle V3"),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingDayMonth: ID3FrameRecordingDayMonth(day: 5, month: 8),
                .recordingYear: ID3FrameRecordingYear(year: 2020),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameUnsynchronisedLyrics(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"),
                .iTunesGrouping: ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .iTunesMovementName: ID3FrameWithStringContent(content: "MovementName V3"),
                .iTunesMovementIndex: ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount: ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory: ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .iTunesPodcastDescription: ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .iTunesPodcastID: ID3FrameWithStringContent(content: "PodcastID V3"),
                .iTunesPodcastKeywords: ID3FrameWithStringContent(content: "PodcastKeywords V3")
            ]
        )

        XCTAssertEqual(id3Tag.debugDescription,
                       """
            ID3Tag:
            - size: 0
            - version: version3
            - artist: artist V3
            - composer: composer V3
            - conductor: conductor V3
            - contentGrouping: ContentGrouping V3
            - copyright: Copyright V3
            - encodedBy: EncodedBy V3
            - encoderSettings: EncoderSettings V3
            - fileOwner: FileOwner V3
            - iTunesGrouping: ItunesGrouping V3
            - lyricist: Lyricist V3
            - mixArtist: MixArtist V3
            - iTunesMovementIndex: 6
            - iTunesMovementCount: 13
            - iTunesMovementName: MovementName V3
            - podcastCategory: PodcastCategory V3
            - podcastDescription: PodcastDescription V3
            - podcastID: PodcastID V3
            - podcastKeywords: PodcastKeywords V3
            - publisher: Publisher V3
            - subtitle: Subtitle V3
            - albumArtist: album artist V3
            - title: title V3
            - trackPosition: 2 of 9
            - discPosition: 1 of 3
            - album: album V3
            - recordingDateTime: -
            - recordingYear: 2020
            - recordingDayMonth: 5 8
            - recordingHourMinute: 15 39
            - genre: Optional(ID3TagEditor.ID3Genre.metal) - Optional("Metalcore")
            - attachedPicture:
            frontCover jpeg

            backCover jpeg

            - unsynchronisedLyrics:
            language: eng
            contentDescription: CD
            content: v3 eng unsync lyrics

            language: ita
            contentDescription: CD
            content: v3 ita unsync lyrics

            """)
    }
}
