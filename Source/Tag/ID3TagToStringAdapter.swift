//
//  ID3TagToStringAdapter.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 29.10.20.
//  2020 Fabrizio Duroni.
//

// swiftlint:disable line_length

import Foundation

class ID3TagToStringAdapter {
    func adapt(id3Tag: ID3Tag) -> String {
        return """
        ID3Tag:
        - size: \(id3Tag.properties.size)
        - version: \(id3Tag.properties.version)
        - artist: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .artist))
        - composer: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .composer))
        - conductor: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .conductor))
        - contentGrouping: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .contentGrouping))
        - copyright: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .copyright))
        - encodedBy: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .encodedBy))
        - encoderSettings: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .encoderSettings))
        - fileOwner: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .fileOwner))
        - lyricist: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .lyricist))
        - mixArtist: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .mixArtist))
        - publisher: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .publisher))
        - subtitle: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .subtitle))
        - albumArtist: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .albumArtist))
        - title: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .title))
        - trackPosition: \((id3Tag.frames[.trackPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - discPosition: \((id3Tag.frames[.discPosition] as? ID3FramePartOfTotal)?.debugDescription ?? "-")
        - album: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .album))
        - recordingDateTime: \(
            (id3Tag.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.debugDescription ?? "-"
        )
        - recordingYear: \((id3Tag.frames[.recordingYear] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - recordingDayMonth: \((id3Tag.frames[.recordingDayMonth] as? ID3FrameRecordingDayMonth)?.debugDescription ?? "-")
        - recordingHourMinute: \((id3Tag.frames[.recordingHourMinute] as? ID3FrameRecordingHourMinute)?.debugDescription ?? "-")
        - genre: \((id3Tag.frames[.genre] as? ID3FrameGenre)?.debugDescription ?? "-")
        - attachedPicture:\(ID3PictureType.allCases.reduce("", { (accumulator: String, current: ID3PictureType) in
            if let frameDescription = (id3Tag.frames[.attachedPicture(current)] as? ID3FrameAttachedPicture)?.debugDescription {
                return accumulator + "\n" + frameDescription + "\n"
            }

            return accumulator
        }))
        - unsynchronisedLyrics:\(adaptFrameWithLocalizedContent(id3Tag: id3Tag, frameName: FrameName.unsynchronizedLyrics))
        - comments:\(adaptFrameWithLocalizedContent(id3Tag: id3Tag, frameName: FrameName.comment))
        - iTunesGrouping: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesGrouping))
        - iTunesMovementIndex: \((id3Tag.frames[.iTunesMovementIndex] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementCount: \((id3Tag.frames[.iTunesMovementCount] as? ID3FrameWithIntegerContent)?.debugDescription ?? "-")
        - iTunesMovementName: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesMovementName))
        - iTunesPodcastCategory: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesPodcastCategory))
        - iTunesPodcastDescription: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesPodcastDescription))
        - iTunesPodcastID: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesPodcastID))
        - iTunesPodcastKeywords: \(adaptFrameWithStringContentFrom(id3Tag: id3Tag, frameName: .iTunesPodcastKeywords))
        """
    }

    private func adaptFrameWithStringContentFrom(id3Tag: ID3Tag, frameName: FrameName) -> String {
        return (id3Tag.frames[frameName] as? ID3FrameWithStringContent)?.content ?? "-"
    }

    private func adaptFrameWithLocalizedContent(id3Tag: ID3Tag, frameName: (ID3FrameContentLanguage) -> FrameName) -> String {
        return ID3FrameContentLanguage.allCases.reduce("", { (accumulator: String, current: ID3FrameContentLanguage) in
            if let frameDescription = (id3Tag.frames[frameName(current)] as? ID3FrameWithLocalizedContent)?.debugDescription {
                return accumulator + "\n" + frameDescription + "\n"
            }

            return accumulator
        })
    }
}

// swiftlint:enable line_length
