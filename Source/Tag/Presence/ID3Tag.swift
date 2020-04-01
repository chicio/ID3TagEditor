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
        - contentGroup: \((self.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content ?? "-")
        - copyright: \((self.frames[.Copyright] as? ID3FrameWithStringContent)?.content ?? "-")
        - encodedBy: \((self.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content ?? "-")
        - encoderSettings: \((self.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content ?? "-")
        - fileOwner: \((self.frames[.FileOwner] as? ID3FrameWithStringContent)?.content ?? "-")
        - fileType: \((self.frames[.FileType] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesGrouping: \((self.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content ?? "-")
        - lyricist: \((self.frames[.Lyricist] as? ID3FrameWithStringContent)?.content ?? "-")
        - mediaType: \((self.frames[.MediaType] as? ID3FrameWithStringContent)?.content ?? "-")
        - arranger: \((self.frames[.Arranger] as? ID3FrameWithStringContent)?.content ?? "-")
        - iTunesCompilation: \((self.frames[.ITunesCompilation] as? ID3FrameWithBooleanContent)?.debugDescription ?? "-")
        - iTunesMovementIndex: \((self.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementCount: \((self.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementName: \((self.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcast: \((self.frames[.Podcast] as? ID3FrameWithBooleanContent)?.debugDescription ?? "-")
        - podcastCategory: \((self.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastDescription: \((self.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastID: \((self.frames[.PodcastID] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastKeywords: \((self.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content ?? "-")
        - publisher: \((self.frames[.Publisher] as? ID3FrameWithStringContent)?.content ?? "-")
        - subtitle: \((self.frames[.Subtitle] as? ID3FrameWithStringContent)?.content ?? "-")
        - unsyncedLyrics: \((self.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.debugDescription ?? "-")
        - comment: \((self.frames[.Comment] as? ID3FrameCommentTypes)?.debugDescription ?? "-")
        - language: \((self.frames[.Language] as? ID3FrameWithStringContent)?.content ?? "-")
        - albumArtist: \((self.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - title: \((self.frames[.Title] as? ID3FrameWithStringContent)?.content ?? "-")
        - trackPosition: \((self.frames[.TrackPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - discPosition: \((self.frames[.DiscPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - userDefinedTextInformation: \((self.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content ?? "-")
        - album: \((self.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "-")
        - bpm: \((self.frames[.BPM] as? ID3FrameWithIntegerContent)?.content ?? "-")
        - initialKey: \((self.frames[.InitialKey] as? ID3FrameWithStringContent)?.content ?? "-")
        - ISRC: \((self.frames[.ISRC] as? ID3FrameWithIntegerContent)?.content ?? "-")
        - length: \((self.frames[.Length] as? ID3FrameWithIntegerContent)?.content ?? "-")
        - mood: \((self.frames[.Mood] as? ID3FrameWithStringContent)?.content ?? "-")
        - originalAlbum: \((self.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content ?? "-")
        - originalArtist: \((self.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - originalFilename: \((self.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content ?? "-")
        - originalLyricist: \((self.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content ?? "-")
        - playlistDelay: \((self.frames[.PlaylistDelay] as? ID3FrameWithIntegerContent)?.content ?? "-")
        - radioStation: \((self.frames[.RadioStation] as? ID3FrameWithStringContent)?.content ?? "-")
        - radioStationOwner: \((self.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.content ?? "-")
        - setSubtitle: \((self.frames[.SetSubtitle] as? ID3FrameWithStringContent)?.content ?? "-")
        - sortAlbum: \((self.frames[.SortAlbum] as? ID3FrameWithStringContent)?.content ?? "-")
        - sortAlbumArtist: \((self.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - sortArtist: \((self.frames[.SortArtist] as? ID3FrameWithStringContent)?.content ?? "-")
        - sortComposer: \((self.frames[.SortComposer] as? ID3FrameWithStringContent)?.content ?? "-")
        - sortTitle: \((self.frames[.SortTitle] as? ID3FrameWithStringContent)?.content ?? "-")
        - artistUrl: \((self.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - audioFileUrl: \((self.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - audioSourceUrl: \((self.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - copyrightUrl: \((self.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - podcastUrl: \((self.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - publisherUrl: \((self.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - radioStationUrl: \((self.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.content ?? "-")
        - userDefinedUrl: \((self.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content ?? "-")
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
