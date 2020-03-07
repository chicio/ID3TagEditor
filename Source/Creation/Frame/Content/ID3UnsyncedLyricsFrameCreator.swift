//
//  ID3UnsyncedLyricsFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//
import Foundation

class ID3UnsyncedLyricsFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: FrameFromStringContentCreator
    private var id3FrameConfiguration: ID3FrameConfiguration

    init(frameCreator: FrameFromStringContentCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }

    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let lyricsFrame = id3Tag.frames[.UnsyncedLyrics] as? ID3FrameCommentLyrics {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .UnsyncedLyrics,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version,
                    content: adapt(lyrics: lyricsFrame)
            )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }

    private func adapt(lyrics: ID3FrameCommentLyrics) -> String {
        var lyricsString = ""
        if let lyricsLanguage = lyrics.language {
            lyricsString = "(\(lyricsLanguage))"
        }
        if let lyricsDescription = lyrics.contentDescription {
            lyricsString = lyricsString + "\(lyricsDescription)"
        }
        lyricsString = lyricsString + "\(lyrics.contentText)"
        return lyricsString
    }
}
