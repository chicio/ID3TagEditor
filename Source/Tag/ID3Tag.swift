//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

/**
 A class used to represent an ID3 tag.
 */
public class ID3Tag: CustomDebugStringConvertible {
    /// The properties of the tag. The public available property to the user of the frmaework is the versions property.
    public var properties: ID3TagProperties
    /// Dictionary that contains the frames extracted or to be added to the id3 tag for an mp3 file.
    public lazy var frames: [FrameName: ID3Frame] = {
        return [:]
    }()
    /// ID3Tag description, useful for debug.
    public var debugDescription: String {
        return """
        ID3Tag:
        - size: \(self.properties.size)
        - version: \(self.properties.version)
        - artist: \((self.frames[.artist] as? ID3FrameWithStringContent)?.content ?? "-")
        - composer: \((self.frames[.composer] as? ID3FrameWithStringContent)?.content ?? "-")
        - conductor: \((self.frames[.conductor] as? ID3FrameWithStringContent)?.content ?? "-")
        - contentGrouping: \((self.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content ?? "-")
        - copyright: \((self.frames[.copyright] as? ID3FrameWithStringContent)?.content ?? "-")
        - encodedBy: \((self.frames[.encodedBy] as? ID3FrameWithStringContent)?.content ?? "-")
        - encoderSettings: \((self.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content ?? "-")
        - fileOwner: \((self.frames[.fileOwner] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesGrouping: \((self.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content ?? "-")
        - lyricist: \((self.frames[.lyricist] as? ID3FrameWithStringContent)?.content ?? "-")
        - mixArtist: \((self.frames[.mixArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesMovementIndex: \((self.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementCount: \((self.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementName: \((self.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastCategory: \((self.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastDescription: \((self.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastID: \((self.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastKeywords: \((self.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content ?? "-")
        - publisher: \((self.frames[.publisher] as? ID3FrameWithStringContent)?.content ?? "-")
        - subtitle: \((self.frames[.subtitle] as? ID3FrameWithStringContent)?.content ?? "-")
        - albumArtist: \((self.frames[.albumArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - title: \((self.frames[.title] as? ID3FrameWithStringContent)?.content ?? "-")
        - trackPosition: \((self.frames[.trackPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - discPosition: \((self.frames[.discPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - album: \((self.frames[.album] as? ID3FrameWithStringContent)?.content ?? "-")
        - recordingDateTime: \(
            (self.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.debugDescription ?? "-"
        )
        - recordingYear: \((self.frames[.recordingYear] as? ID3FrameRecordingYear)?.debugDescription ?? "-")
        - recordingDayMonth: \((self.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.debugDescription ?? "-")
        - recordingHourMinute: \((self.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.debugDescription ?? "-")
        - genre: \((self.frames[.genre] as? ID3FrameGenre)?.debugDescription ?? "-")
        - attachedPicture:\(ID3PictureType.allCases.reduce("", { (accumulator: String, current: ID3PictureType) in
            if let frameDescription = (self.frames[.attachedPicture(current)] as? ID3FrameAttachedPicture)?.debugDescription {
                return accumulator + "\n" + frameDescription + "\n"
            }

            return accumulator
        }))
        - unsynchronisedLyrics:\(ID3FrameContentLanguage.allCases.reduce("", { (accumulator: String, current: ID3FrameContentLanguage) in
            if let frameDescription = (self.frames[.unsynchronizedLyrics(current)] as? ID3FrameUnsynchronisedLyrics)?.debugDescription {
                return accumulator + "\n" + frameDescription + "\n"
            }

            return accumulator
        }))
        """
    }

    init(version: ID3Version, frames: [FrameName: ID3Frame]) {
        self.properties = ID3TagProperties(version: version, size: 0)
        self.frames = frames
    }
}
