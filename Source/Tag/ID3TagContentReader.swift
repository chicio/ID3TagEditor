//
//  ID3TagFramesReader.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02.02.22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

// swiftlint:disable file_length

/**
 A struct to represent a simplified version of the genre frame and its content.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct Genre: Equatable {
    /// The genre identifier as reported in the ID3 standard.
    public let identifier: ID3Genre?
    /// The genre description.
    public let description: String?
}

/**
 A struct to represent a simplified version frames that contain a position (disc position, record position etc.).
 Used only as return type inside `ID3TagContentReader`.
 */
public struct PartOfTotal: Equatable {
    /// The position of the element in the total.
    public let position: Int
    /// The number of elements.
    public let total: Int?
}

/**
 A struct to represent a simplified version of same frames that contain day and month data.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct DayMonth: Equatable {
    /// Day of the month as number.
    public let day: Int?
    /// Month as number.
    public let month: Int?
}

/**
 A struct to represent a simplified version of same frames that contain hour and minute data.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct HourMinute: Equatable {
    /// Hour as number.
    public let hour: Int?
    /// Minute as number.
    public let minute: Int?
}

/**
 A struct to represent a simplified version of the attached picture frame and its content.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct AttachedPicture: Equatable {
    /// The image bytes as `Data`.
    public let picture: Data
    /// The image format.
    public let format: ID3PictureFormat
    /// The image type as reported in the ID3 tag standard.
    public let type: ID3PictureType
}

/**
 A struct to represent a simplified version of frames that contain localized content.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct LocalizedContent: Equatable {
    /// The language of the localized content.
    public let language: ID3FrameContentLanguage
    /// A short description of the localized content.
    public let contentDescription: String
    /// The content localized.
    public let content: String
}

/**
 A struct to represent a simplified version of same frames that contain datetime data.
 Used only as return type inside `ID3TagContentReader`.
 */
public struct DateTime: Equatable {
    /// Day value.
    public var day: Int?
    /// Month value.
    public var month: Int?
    /// Year value.
    public var year: Int?
    /// Hour value.
    public var hour: Int?
    /// Minute value.
    public var minute: Int?
}

/**
 Class that "makes your life easier" when it comes to read data from the ID3 tag.
 Create an instance of this class by passing to it a `ID3Tag` instance
 (obtained from the read methods of `ID3TagEditor`).
 In this way you will now have access to all the data contained in the ID3 tag by using the methods of this class.
 */
public class ID3TagContentReader {
    private let id3Tag: ID3Tag

    /**
     Init the ID3TagContentReader.
     
     - parameter id3Tag: the tag to be read.
     */
    public init(id3Tag: ID3Tag) {
        self.id3Tag = id3Tag
    }

    /**
      Read the title frame content.
     
      - returns: the title, or null.
     */
    public func title() -> String? {
        return (id3Tag.frames[.title] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the album frame content.
     
      - returns: the album, or null.
     */
    public func album() -> String? {
        return (id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the album artist frame content.
     
      - returns: the album artist, or null.
     */
    public func albumArtist() -> String? {
        return (id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the artist frame content.
     
      - returns: the artist, or null.
     */
    public func artist() -> String? {
        return (id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the composer frame content.
     
      - returns: the composer, or null.
     */
    public func composer() -> String? {
        return (id3Tag.frames[.composer] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the conductor frame content.
     
      - returns: the conductor, or null.
     */
    public func conductor() -> String? {
        return (id3Tag.frames[.conductor] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the content grouping frame content.
     
      - returns: the content grouping, or null.
     */
    public func contentGrouping() -> String? {
        return (id3Tag.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the copyright frame content.
     
      - returns: the copyright, or null.
     */
    public func copyright() -> String? {
        return (id3Tag.frames[.copyright] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the encoded by frame content.
     
      - returns: the encoded by, or null.
     */
    public func encodedBy() -> String? {
        return (id3Tag.frames[.encodedBy] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the encoder settings frame content.
     
      - returns: the encoder settings, or null.
     */
    public func encoderSettings() -> String? {
        return (id3Tag.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the lyricist frame content.
     
      - returns: the lyricist, or null.
     */
    public func lyricist() -> String? {
        return (id3Tag.frames[.lyricist] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the mix artist frame content.
     
      - returns: the mix artist, or null.
     */
    public func mixArtist() -> String? {
        return (id3Tag.frames[.mixArtist] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the publisher frame content.
     
      - returns: the publisher, or null.
     */
    public func publisher() -> String? {
        return (id3Tag.frames[.publisher] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the subtitle frame content.
     
      - returns: the subtitle, or null.
     */
    public func subtitle() -> String? {
        return (id3Tag.frames[.subtitle] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the beats per minute frame content.
     
      - returns: the beats per minute, or null.
     */
    public func beatsPerMinute() -> Int? {
        return (id3Tag.frames[.beatsPerMinute] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the original filename frame content.
     
      - returns: the original filename, or null.
     */
    public func originalFilename() -> String? {
        return (id3Tag.frames[.originalFilename] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the lenght in milliseconds frame content.
     
      - returns: the lenght in milliseconds, or null.
     */
    public func lengthInMilliseconds() -> Int? {
        return (id3Tag.frames[.lengthInMilliseconds] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the size in bytes frame content.
     
      - returns: the size in bytes, or null.
     */
    public func sizeInBytes() -> Int? {
        return (id3Tag.frames[.sizeInBytes] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the genre frame content.
     
      - returns: the `Genre`, or null.
     */
    public func genre() -> Genre? {
        guard let genreFrame = (id3Tag.frames[.genre] as? ID3FrameGenre) else {
            return nil
        }

        return Genre(identifier: genreFrame.identifier, description: genreFrame.description)
    }

    /**
      Read the disc position frame content.
     
      - returns: the disc position as `PartOfTotal`, or null.
     */
    public func discPosition() -> PartOfTotal? {
        guard let discPositionFrame = (id3Tag.frames[.discPosition] as? ID3FramePartOfTotal) else {
            return nil
        }

        return PartOfTotal(position: discPositionFrame.part, total: discPositionFrame.total)
    }

    /**
      Read the track position frame content.
     
      - returns: the track position as `PartOfTotal`, or null.
     */
    public func trackPosition() -> PartOfTotal? {
        guard let trackPositionFrame = (id3Tag.frames[.trackPosition] as? ID3FramePartOfTotal) else {
            return nil
        }

        return PartOfTotal(position: trackPositionFrame.part, total: trackPositionFrame.total)
    }

    /**
      Read the recording day month frame content.
     
      - returns: the recording day month as `DayMonth`, or null.
     */
    public func recordingDayMonth() -> DayMonth? {
        guard let recordingDayMonthFrame = (id3Tag.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth) else {
            return nil
        }

        return DayMonth(day: recordingDayMonthFrame.day, month: recordingDayMonthFrame.month)
    }

    /**
      Read the recording year frame content.
     
      - returns: the recording year, or null.
     */
    public func recordingYear() -> Int? {
        return (id3Tag.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the recording hour minute frame content.
     
      - returns: the recording hour minute as `HourMinute`, or null.
     */
    public func recordingHourMinute() -> HourMinute? {
        guard let recordingHourMinuteFrame
                = (id3Tag.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute) else {
            return nil
        }

        return HourMinute(hour: recordingHourMinuteFrame.hour, minute: recordingHourMinuteFrame.minute)
    }

    /**
      Read the recording date time frame content.
     
      - returns: the recording date time as `DateTime`, or null.
     */
    public func recordingDateTime() -> DateTime? {
        guard let recordingDateTime
                = (id3Tag.frames[.recordingDateTime] as? ID3FrameRecordingDateTime) else {
            return nil
        }

        return DateTime(
            day: recordingDateTime.recordingDateTime.date?.day,
            month: recordingDateTime.recordingDateTime.date?.month,
            year: recordingDateTime.recordingDateTime.date?.year,
            hour: recordingDateTime.recordingDateTime.time?.hour,
            minute: recordingDateTime.recordingDateTime.time?.minute
        )
    }

    /**
      Read the attached pictues frames content.
     
      - returns: the attached picture list as `[AttachedPicture]`, or null.
     */
    public func attachedPictures() -> [AttachedPicture] {
        var pictures: [AttachedPicture] = []
        for type in ID3PictureType.allCases {
            if let picture = (id3Tag.frames[.attachedPicture(type)] as? ID3FrameAttachedPicture) {
                pictures.append(AttachedPicture(picture: picture.picture, format: picture.format, type: picture.type))
            }
        }
        return pictures
    }

    /**
      Read the unsynchronized lyrics frames content.
     
      - returns: the unsynchronized lyric  list as `[LocalizedContent]`, or null.
     */
    public func unsynchronizedLyrics() -> [LocalizedContent] {
        return localizedContent { language in
            id3Tag.frames[.unsynchronizedLyrics(language)] as? ID3FrameWithLocalizedContent
        }
    }

    /**
      Read the comment frames content.
     
      - returns: the comment  list as `[LocalizedContent]`, or null.
     */
    public func comments() -> [LocalizedContent] {
        return localizedContent { language in
            id3Tag.frames[.comment(language)] as? ID3FrameWithLocalizedContent
        }
    }

    /**
      Read the file owner frame content.
     
      - returns: the file owner minute as `String`, or null.
     */
    public func fileOwner() -> String? {
        return (id3Tag.frames[.fileOwner] as? ID3FrameWithStringContent)?.content
    }
    
    /**
      Read the initial key frame content.
     
      - returns: the initial key as `String`, or null.
     */
    public func initialKey() -> String? {
        return (id3Tag.frames[.initialKey] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes grouping frame content.
     
      - returns: the itunes grouping as `String`, or null.
     */
    public func iTunesGrouping() -> String? {
        return (id3Tag.frames[.iTunesGrouping] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes movement name frame content.
     
      - returns: the itunes movement name as `String`, or null.
     */
    public func iTunesMovementName() -> String? {
        return (id3Tag.frames[.iTunesMovementName] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes movement index frame content.
     
      - returns: the itunes movement index as `String`, or null.
     */
    public func iTunesMovementIndex() -> Int? {
        return (id3Tag.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the itunes movement count frame content.
     
      - returns: the itunes movement count as `String`, or null.
     */
    public func iTunesMovementCount() -> Int? {
        return (id3Tag.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.value
    }

    /**
      Read the itunes podcast category frame content.
     
      - returns: the itunes podcast category as `String`, or null.
     */
    public func iTunesPodcastCategory() -> String? {
        return (id3Tag.frames[.iTunesPodcastCategory] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes podcast description frame content.
     
      - returns: the itunes podcast description as `String`, or null.
     */
    public func iTunesPodcastDescription() -> String? {
        return (id3Tag.frames[.iTunesPodcastDescription] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes podcast id frame content.
     
      - returns: the itunes podcast id as `String`, or null.
     */
    public func iTunesPodcastID() -> String? {
        return (id3Tag.frames[.iTunesPodcastID] as? ID3FrameWithStringContent)?.content
    }

    /**
      Read the itunes podcast keywords frame content.
     
      - returns: the itunes podcast keywords as `String`, or null.
     */
    public func iTunesPodcastKeywords() -> String? {
        return (id3Tag.frames[.iTunesPodcastKeywords] as? ID3FrameWithStringContent)?.content
    }

    private func localizedContent(
        getFrame: ((ID3FrameContentLanguage) -> ID3FrameWithLocalizedContent?)
    ) -> [LocalizedContent] {
        var contents: [LocalizedContent] = []
        for language in ID3FrameContentLanguage.allCases {
            if let content = getFrame(language) {
                contents.append(
                    LocalizedContent(
                        language: content.language,
                        contentDescription: content.contentDescription,
                        content: content.content
                    )
                )
            }
        }
        return contents
    }
}
