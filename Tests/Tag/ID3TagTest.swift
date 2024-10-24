//
//  ID3TagTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 20.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable line_length
// swiftlint:disable function_body_length

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3TagTest {
    @Test func testDebugDescriptionv3() throws {
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
                .recordingYear: ID3FrameWithIntegerContent(value: 2020),
                .recordingHourMinute: ID3FrameRecordingHourMinute(hour: 15, minute: 39),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"),
                .comment(.ita): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita comment"),
                .comment(.eng): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng comment"),
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

        #expect(
            id3Tag.debugDescription ==
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
            - lyricist: Lyricist V3
            - mixArtist: MixArtist V3
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

            - comments:
            language: eng
            contentDescription: CD
            content: v3 eng comment

            language: ita
            contentDescription: CD
            content: v3 ita comment

            - iTunesGrouping: ItunesGrouping V3
            - iTunesMovementIndex: 6
            - iTunesMovementCount: 13
            - iTunesMovementName: MovementName V3
            - iTunesPodcastCategory: PodcastCategory V3
            - iTunesPodcastDescription: PodcastDescription V3
            - iTunesPodcastID: PodcastID V3
            - iTunesPodcastKeywords: PodcastKeywords V3
            """)
    }

    @Test func testDebugDescriptionv4() throws {
        let artFront: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example-cover", fileType: "jpg")))
        let artBack: Data = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "cover2", fileType: "jpg")))

        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .title: ID3FrameWithStringContent(content: "title V4"),
                .album: ID3FrameWithStringContent(content: "album V4"),
                .albumArtist: ID3FrameWithStringContent(content: "album artist V4"),
                .artist: ID3FrameWithStringContent(content: "artist V4"),
                .composer: ID3FrameWithStringContent(content: "composer V4"),
                .conductor: ID3FrameWithStringContent(content: "conductor V4"),
                .contentGrouping: ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .copyright: ID3FrameWithStringContent(content: "Copyright V4"),
                .encodedBy: ID3FrameWithStringContent(content: "EncodedBy V4"),
                .encoderSettings: ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .fileOwner: ID3FrameWithStringContent(content: "FileOwner V4"),
                .lyricist: ID3FrameWithStringContent(content: "Lyricist V4"),
                .mixArtist: ID3FrameWithStringContent(content: "MixArtist V4"),
                .publisher: ID3FrameWithStringContent(content: "Publisher V4"),
                .subtitle: ID3FrameWithStringContent(content: "Subtitle V4"),
                .genre: ID3FrameGenre(genre: .metal, description: "Metalcore"),
                .discPosition: ID3FramePartOfTotal(part: 1, total: 3),
                .trackPosition: ID3FramePartOfTotal(part: 2, total: 9),
                .recordingDateTime: ID3FrameRecordingDateTime(recordingDateTime: RecordingDateTime(date: RecordingDate(day: 15, month: 10, year: 2020),
                                                                                                    time: RecordingTime(hour: 21, minute: 50))),
                .attachedPicture(.frontCover): ID3FrameAttachedPicture(picture: artFront, type: .frontCover, format: .jpeg),
                .attachedPicture(.backCover): ID3FrameAttachedPicture(picture: artBack, type: .backCover, format: .jpeg),
                .unsynchronizedLyrics(.ita): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "V4 ita unsync lyrics"),
                .unsynchronizedLyrics(.eng): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "V4 eng unsync lyrics"),
                .comment(.ita): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "V4 ita comment"),
                .comment(.eng): ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "V4 eng comment"),
                .iTunesGrouping: ID3FrameWithStringContent(content: "ItunesGrouping V4"),
                .iTunesMovementName: ID3FrameWithStringContent(content: "MovementName V4"),
                .iTunesMovementIndex: ID3FrameWithIntegerContent(value: 6),
                .iTunesMovementCount: ID3FrameWithIntegerContent(value: 13),
                .iTunesPodcastCategory: ID3FrameWithStringContent(content: "PodcastCategory V4"),
                .iTunesPodcastDescription: ID3FrameWithStringContent(content: "PodcastDescription V4"),
                .iTunesPodcastID: ID3FrameWithStringContent(content: "PodcastID V4"),
                .iTunesPodcastKeywords: ID3FrameWithStringContent(content: "PodcastKeywords V4")
            ]
        )

        #expect(
            id3Tag.debugDescription ==
            """
            ID3Tag:
            - size: 0
            - version: version4
            - artist: artist V4
            - composer: composer V4
            - conductor: conductor V4
            - contentGrouping: ContentGrouping V4
            - copyright: Copyright V4
            - encodedBy: EncodedBy V4
            - encoderSettings: EncoderSettings V4
            - fileOwner: FileOwner V4
            - lyricist: Lyricist V4
            - mixArtist: MixArtist V4
            - publisher: Publisher V4
            - subtitle: Subtitle V4
            - albumArtist: album artist V4
            - title: title V4
            - trackPosition: 2 of 9
            - discPosition: 1 of 3
            - album: album V4
            - recordingDateTime: Date: (15 10 2020 - Time: (21 50)
            - recordingYear: -
            - recordingDayMonth: -
            - recordingHourMinute: -
            - genre: Optional(ID3TagEditor.ID3Genre.metal) - Optional("Metalcore")
            - attachedPicture:
            frontCover jpeg

            backCover jpeg

            - unsynchronisedLyrics:
            language: eng
            contentDescription: CD
            content: V4 eng unsync lyrics

            language: ita
            contentDescription: CD
            content: V4 ita unsync lyrics

            - comments:
            language: eng
            contentDescription: CD
            content: V4 eng comment

            language: ita
            contentDescription: CD
            content: V4 ita comment

            - iTunesGrouping: ItunesGrouping V4
            - iTunesMovementIndex: 6
            - iTunesMovementCount: 13
            - iTunesMovementName: MovementName V4
            - iTunesPodcastCategory: PodcastCategory V4
            - iTunesPodcastDescription: PodcastDescription V4
            - iTunesPodcastID: PodcastID V4
            - iTunesPodcastKeywords: PodcastKeywords V4
            """
        )
    }
}

// swiftlint:enable line_length
// swiftlint:enable function_body_length
