//
//  ID3TagFramesReader.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 02.02.22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3TagReader {
    private let id3Tag: ID3Tag

    init(id3Tag: ID3Tag) {
        self.id3Tag = id3Tag
    }

    func title() -> String? {
        return (id3Tag.frames[.title] as? ID3FrameWithStringContent)?.content
    }

    func album() -> String? {
        return (id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content
    }

    func albumArtist() -> String? {
        return (id3Tag.frames[.albumArtist] as? ID3FrameWithStringContent)?.content
    }

    func artist() -> String? {
        return (id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content
    }

    func composer() -> String? {
        return (id3Tag.frames[.composer] as? ID3FrameWithStringContent)?.content
    }

    func conductor() -> String? {
        return (id3Tag.frames[.conductor] as? ID3FrameWithStringContent)?.content
    }

    func contentGrouping() -> String? {
        return (id3Tag.frames[.contentGrouping] as? ID3FrameWithStringContent)?.content
    }

    func encodedBy() -> String? {
        return (id3Tag.frames[.encodedBy] as? ID3FrameWithStringContent)?.content
    }

    func encoderSettings() -> String? {
        return (id3Tag.frames[.encoderSettings] as? ID3FrameWithStringContent)?.content
    }

    func lyricist() -> String? {
        return (id3Tag.frames[.lyricist] as? ID3FrameWithStringContent)?.content
    }

    func mixArtist() -> String? {
        return (id3Tag.frames[.mixArtist] as? ID3FrameWithStringContent)?.content
    }

    func publisher() -> String? {
        return (id3Tag.frames[.publisher] as? ID3FrameWithStringContent)?.content
    }

    func subtitle() -> String? {
        return (id3Tag.frames[.subtitle] as? ID3FrameWithStringContent)?.content
    }

    func beatsPerMinute() -> Int? {
        return (id3Tag.frames[.beatsPerMinute] as? ID3FrameWithIntegerContent)?.value
    }

    func originalFilename() -> String? {
        return (id3Tag.frames[.originalFilename] as? ID3FrameWithStringContent)?.content
    }

    func lengthInMilliseconds() -> Int? {
        return (id3Tag.frames[.lengthInMilliseconds] as? ID3FrameWithIntegerContent)?.value
    }

    func sizeInBytes() -> Int? {
        return (id3Tag.frames[.sizeInBytes] as? ID3FrameWithIntegerContent)?.value
    }

    func genre() -> Genre? {
        guard let genreFrame = (id3Tag.frames[.genre] as? ID3FrameGenre) else {
            return nil
        }

        return Genre(identifier: genreFrame.identifier, description: genreFrame.description)
    }

    func discPosition() -> PartOfTotal? {
        guard let discPositionFrame = (id3Tag.frames[.discPosition] as? ID3FramePartOfTotal) else {
            return nil
        }

        return PartOfTotal(position: discPositionFrame.part, total: discPositionFrame.total)
    }

    func trackPosition() -> PartOfTotal? {
        guard let trackPositionFrame = (id3Tag.frames[.trackPosition] as? ID3FramePartOfTotal) else {
            return nil
        }

        return PartOfTotal(position: trackPositionFrame.part, total: trackPositionFrame.total)
    }

    func recordingDayMonth() -> DayMonth? {
        guard let recordingDayMonthFrame = (id3Tag.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth) else {
            return nil
        }

        return DayMonth(day: recordingDayMonthFrame.day, month: recordingDayMonthFrame.month)
    }

    func recordingYear() -> Int? {
        return (id3Tag.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.value
    }

    func recordingHourMinute() -> HourMinute? {
        guard let recordingHourMinuteFrame
                = (id3Tag.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute) else {
            return nil
        }

        return HourMinute(hour: recordingHourMinuteFrame.hour, minute: recordingHourMinuteFrame.minute)
    }

    func attachedPictures() -> [AttachedPicture] {
        var pictures: [AttachedPicture] = []
        for type in ID3PictureType.allCases {
            if let picture = (id3Tag.frames[.attachedPicture(type)] as? ID3FrameAttachedPicture) {
                pictures.append(AttachedPicture(picture: picture.picture, format: picture.format, type: picture.type))
            }
        }
        return pictures
    }

    func unsynchronizedLyrics() -> [LocalizedContent] {
        var unsynchronizedLyrics: [LocalizedContent] = []
        for language in ID3FrameContentLanguage.allCases {
            if let unsynchronizedLyric =
                (id3Tag.frames[.unsynchronizedLyrics(language)] as? ID3FrameWithLocalizedContent) {
                unsynchronizedLyrics.append(
                    LocalizedContent(
                        language: unsynchronizedLyric.language,
                        contentDescription: unsynchronizedLyric.contentDescription,
                        content: unsynchronizedLyric.content
                    )
                )
            }
        }
        return unsynchronizedLyrics
    }
}
