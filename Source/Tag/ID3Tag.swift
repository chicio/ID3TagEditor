//
//  ID3Tag.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A class used to represent an ID3 tag.
 */
public class ID3Tag: CustomDebugStringConvertible {
    /// The properties of the tag. The public available property to the user of the frmaework is the versions property.
    public var properties: TagProperties
    /// Dictionary that contains the frames extracted or to be added to the id3 tag for an mp3 file.
    public lazy var frames: [FrameName : ID3Frame] = {
        return [:]
    }()
    /// ID3Tag description, useful for debug.
    public var debugDescription: String {
        return """
        ID3Tag:
        - size: \(self.properties.size)
        - version: \(self.properties.version)
        - artist: \((self.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "-")
        - composer: \((self.frames[.Composer] as? ID3FrameWithStringContent)?.content ?? "-")
        - conductor: \((self.frames[.Conductor] as? ID3FrameWithStringContent)?.content ?? "-")
        - contentGrouping: \((self.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content ?? "-")
        - copyright: \((self.frames[.Copyright] as? ID3FrameWithStringContent)?.content ?? "-")
        - encodedBy: \((self.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content ?? "-")
        - encoderSettings: \((self.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content ?? "-")
        - fileOwner: \((self.frames[.FileOwner] as? ID3FrameWithStringContent)?.content ?? "-")
        - fileType: \((self.frames[.FileType] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesGrouping: \((self.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content ?? "-")
        - lyricist: \((self.frames[.Lyricist] as? ID3FrameWithStringContent)?.content ?? "-")
        - mixArtist: \((self.frames[.MixArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesMovementIndex: \((self.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementCount: \((self.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementName: \((self.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastCategory: \((self.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastDescription: \((self.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastID: \((self.frames[.PodcastID] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastKeywords: \((self.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content ?? "-")
        - publisher: \((self.frames[.Publisher] as? ID3FrameWithStringContent)?.content ?? "-")
        - subtitle: \((self.frames[.Subtitle] as? ID3FrameWithStringContent)?.content ?? "-")
        - albumArtist: \((self.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - title: \((self.frames[.Title] as? ID3FrameWithStringContent)?.content ?? "-")
        - trackPosition: \((self.frames[.TrackPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - discPosition: \((self.frames[.DiscPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - album: \((self.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "-")
        - recordingDateTime: \(
            (self.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.debugDescription ?? "-"
        )
        - recordingYear: \((self.frames[.RecordingYear] as? ID3FrameRecordingYear)?.debugDescription ?? "-")
        - recordingDayMonth: \((self.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.debugDescription ?? "-")
        - recordingHourMinute: \((self.frames[.RecordingHourMinute] as? ID3FrameRecordingHourMinute)?.debugDescription ?? "-")
        - genre: \((self.frames[.Genre] as? ID3FrameGenre)?.debugDescription ?? "-")
        - attachedPicture: \(ID3PictureType.allCases.reduce("", {
            $0 + " - " + ((self.frames[.AttachedPicture($1)] as? ID3FrameAttachedPicture)?.debugDescription ?? "")
        }) )
        """
    }
    
    /**
     Init an ID3 tag.
     
     - parameter version: the version of the ID3 tag. Versions supported: 2.2, 2.3 and 2.4.
     - parameter frames: the list of frames extracted or to be added to the ID3Tag of an mp3 file.
     */
    public init(version: ID3Version, frames: [FrameName : ID3Frame]) {
        self.properties = TagProperties(version: version, size: 0)
        self.frames = frames
    }
}
