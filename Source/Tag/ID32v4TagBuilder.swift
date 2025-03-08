//
//  ID32v4TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable file_length

import Foundation

/**
 Builder used to create a ID32v4 tag.
 It let the user set all the frames included in ID32TagCommonStringFramesBuilder, ID32TagCommonCompositeFramesBuilder,
 RecordingDateTimeFrameBuilder, FileOwnerFrameBuilder and ITunesFramesBuilder.
 */
public class ID32v4TagBuilder: TagBuilder {
    var frames: [FrameName: ID3Frame] = [:]

    /**
     Init a ID32v4TagBuilder instance.
     */
    public init() {}

    /**
      Set the title frame to be written by ID3TagEditor.
     
      - parameter frame: the title frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func title(frame: ID3FrameWithStringContent) -> Self {
        frames[.title] = frame
        return self
    }

    /**
      Set the album frame to be written by ID3TagEditor.
     
      - parameter frame: the album frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func album(frame: ID3FrameWithStringContent) -> Self {
        frames[.album] = frame
        return self
    }

    /**
      Set the albumArtist frame to be written by ID3TagEditor.
     
      - parameter frame: the albumArtist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func albumArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.albumArtist] = frame
        return self
    }

    /**
      Set the artist frame to be written by ID3TagEditor.
     
      - parameter frame: the artist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func artist(frame: ID3FrameWithStringContent) -> Self {
        frames[.artist] = frame
        return self
    }

    /**
      Set the composer frame to be written by ID3TagEditor.
     
      - parameter frame: the composer frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func composer(frame: ID3FrameWithStringContent) -> Self {
        frames[.composer] = frame
        return self
    }

    /**
      Set the conductor frame to be written by ID3TagEditor.
     
      - parameter frame: the conductor frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func conductor(frame: ID3FrameWithStringContent) -> Self {
        frames[.conductor] = frame
        return self
    }

    /**
      Set the content grouping frame to be written by ID3TagEditor.
     
      - parameter frame: the contentGrouping frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func contentGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.contentGrouping] = frame
        return self
    }

    /**
      Set the copyright frame to be written by ID3TagEditor.
     
      - parameter frame: the copyright frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func copyright(frame: ID3FrameWithStringContent) -> Self {
        frames[.copyright] = frame
        return self
    }

    /**
      Set the encoded by frame to be written by ID3TagEditor.
     
      - parameter frame: the encodedBy frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func encodedBy(frame: ID3FrameWithStringContent) -> Self {
        frames[.encodedBy] = frame
        return self
    }

    /**
      Set the encoder settings frame to be written by ID3TagEditor.
     
      - parameter frame: the encoderSettings frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func encoderSettings(frame: ID3FrameWithStringContent) -> Self {
        frames[.encoderSettings] = frame
        return self
    }

    /**
      Set the lyricist frame to be written by ID3TagEditor.
     
      - parameter frame: the lyricist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func lyricist(frame: ID3FrameWithStringContent) -> Self {
        frames[.lyricist] = frame
        return self
    }

    /**
      Set the mix artist frame to be written by ID3TagEditor.
     
      - parameter frame: the mixArtist frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func mixArtist(frame: ID3FrameWithStringContent) -> Self {
        frames[.mixArtist] = frame
        return self
    }

    /**
      Set the publisher frame to be written by ID3TagEditor.
     
      - parameter frame: the publisher frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func publisher(frame: ID3FrameWithStringContent) -> Self {
        frames[.publisher] = frame
        return self
    }

    /**
      Set the subtitle frame to be written by ID3TagEditor.
     
      - parameter frame: the subtitle frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func subtitle(frame: ID3FrameWithStringContent) -> Self {
        frames[.subtitle] = frame
        return self
    }

    /**
      Set the beats per minute frame to be written by ID3TagEditor.
     
      - parameter frame: the beats per minute frame as a ID3FrameWithIntegerContent instance.
     
      - returns: the instance of the builder.
     */
    public func beatsPerMinute(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.beatsPerMinute] = frame
        return self
    }

    /**
      Set the original filename frame to be written by ID3TagEditor.
     
      - parameter frame: the original filename frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func originalFilename(frame: ID3FrameWithStringContent) -> Self {
        frames[.originalFilename] = frame
        return self
    }

    /**
      Set the length in milliseconds frame to be written by ID3TagEditor.
     
      - parameter frame: the length in milliseconds  frame as a ID3FrameWithIntegerContent instance.
     
      - returns: the instance of the builder.
     */
    public func lengthInMilliseconds(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.lengthInMilliseconds] = frame
        return self
    }

    /**
      Set the genre frame to be written by ID3TagEditor.
     
      - parameter frame: the genre frame as a ID3FrameGenre instance.
     
      - returns: the instance of the builder.
     */
    public func genre(frame: ID3FrameGenre) -> Self {
        frames[.genre] = frame
        return self
    }

    /**
      Set the disc position frame to be written by ID3TagEditor.
     
      - parameter frame: the discPosition frame as a ID3FramePartOfTotal instance.
     
      - returns: the instance of the builder.
     */
    public func discPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.discPosition] = frame
        return self
    }

    /**
      Set the track position frame to be written by ID3TagEditor.
     
      - parameter frame: the trackPosition frame as a ID3FramePartOfTotal instance.
     
      - returns: the instance of the builder.
     */
    public func trackPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.trackPosition] = frame
        return self
    }

    /**
     Set an attached picture frame to be written by ID3TagEditor. You can set multiple
     attached picture frames per tag, one for each of the picture types contained in ID3PictureType.
     
      - parameter pictureType: the ID3PictureType associated to the attachedPicture frame to be set.
      - parameter frame: the attachedPicture frame as a ID3FrameAttachedPicture instance.
     
      - returns: the instance of the builder.
     */
    public func attachedPicture(pictureType: ID3PictureType, frame: ID3FrameAttachedPicture) -> Self {
        frames[.attachedPicture(pictureType)] = frame
        return self
    }

    /**
     Set an unsynchronised lyrics frame to be written by ID3TagEditor. You can set multiple
     unsynchronised lyrics frames per tag, one for each of the languages contained in ID3FrameContentLanguage.
     
      - parameter language: the ID3FrameContentLanguage associated to the unsynchronisedLyrics frame to be set.
      - parameter frame: the unsynchronisedLyrics frame as a ID3FrameWithLocalizedContent instance.
     
      - returns: the instance of the builder.
     */
    public func unsynchronisedLyrics(language: ID3FrameContentLanguage,
                                     frame: ID3FrameWithLocalizedContent) -> Self {
        frames[.unsynchronizedLyrics(language)] = frame
        return self
    }

    /**
     Set a comment frame to be written by ID3TagEditor. You can set multiple
     comment frames per tag, one for each of the languages contained in ID3FrameContentLanguage.
     
      - parameter language: the ID3FrameContentLanguage associated to the comment frame to be set.
      - parameter frame: the comment frame as a ID3FrameWithLocalizedContent instance.
     
      - returns: the instance of the builder.
     */
    public func comment(language: ID3FrameContentLanguage,
                        frame: ID3FrameWithLocalizedContent) -> Self {
        frames[.comment(language)] = frame
        return self
    }

    /**
      Set the recordingDateTime frame to be written by ID3TagEditor.
     
      - parameter frame: the recordingDateTime frame as a ID3FrameRecordingDateTime instance.
     
      - returns: the instance of the builder.
     */
    public func recordingDateTime(frame: ID3FrameRecordingDateTime) -> Self {
        frames[.recordingDateTime] = frame
        return self
    }

    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesGrouping frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesGrouping(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesGrouping] = frame
        return self
    }

    /**
      Set the iTunesGrouping frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementName frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesMovementName(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesMovementName] = frame
        return self
    }

    /**
      Set the iTunesMovementIndex frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementIndex frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesMovementIndex(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementIndex] = frame
        return self
    }

    /**
      Set the iTunesMovementCount frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesMovementCount frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesMovementCount(frame: ID3FrameWithIntegerContent) -> Self {
        frames[.iTunesMovementCount] = frame
        return self
    }

    /**
      Set the iTunesPodcastCategory frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastCategory frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesPodcastCategory(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastCategory] = frame
        return self
    }

    /**
      Set the iTunesPodcastDescription frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastDescription frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesPodcastDescription(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastDescription] = frame
        return self
    }

    /**
      Set the iTunesPodcastID frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastID frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesPodcastID(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastID] = frame
        return self
    }

    /**
      Set the iTunesPodcastKeywords frame to be written by ID3TagEditor.
     
      - parameter frame: the iTunesPodcastKeywords frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func iTunesPodcastKeywords(frame: ID3FrameWithStringContent) -> Self {
        frames[.iTunesPodcastKeywords] = frame
        return self
    }

    /**
      Set the fileOwner frame to be written by ID3TagEditor.
     
      - parameter frame: the fileOwner frame as a ID3FrameWithStringContent instance.
     
      - returns: the instance of the builder.
     */
    public func fileOwner(frame: ID3FrameWithStringContent) -> Self {
        frames[.fileOwner] = frame
        return self
    }
    
    /**
      Set the Initial Key frame to be written by ID3TagEditor.
     
     - parameter frame: the initial key frame as a ID3FrameWithStringContent instance.
    
     - returns: the instance of the builder.
     */
    public func initialKey(frame: ID3FrameWithStringContent) -> Self {
        frames[.initialKey] = frame
        return self
    }

    /**
     Build and ID3Tag version 4.
     
      - returns: an ID3Tag version 4 instance to use with the write function of ID3TagEditor.
     */
    public func build() -> ID3Tag {
        return ID3Tag(version: .version4, frames: frames)
    }
}
