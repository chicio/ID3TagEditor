//
//  ID3TagEditorTestAcceptanceNewFrames.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import XCTest
@testable import ID3TagEditor

class ID3TagEditorTestAcceptanceNewFrames: XCTestCase {
    let id3TagEditor = ID3TagEditor()
    
    //MARK: read
    
    func testReadNewFramesV2() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        // Attempting twice allows it to succeed even if the operating system rejects the first attempt. This can happen if the previous test run crashed in the middle without telling the system it was done with the file.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version2)
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V2")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TP3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V2")
        XCTAssertEqual(id3Tag?.frames[.ContentGrouping]?.id3Identifier, "TT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V2")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCR")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V2")
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TEN")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSS")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V2")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMT")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V2")
        XCTAssertEqual(id3Tag?.frames[.MixArtist]?.id3Identifier, "TP4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V2")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual(id3Tag?.frames[.UnsyncedLyrics]?.id3Identifier, "ULT")
        #warning("The data in the “ULT” tag is “55 4C 54 00 00 05 00 00 10 00 00”. That appears to mean “ULT”, a 5‐byte size, a text encoding of Latin‐1, a language of “null, data escape, null”, and nothing more. But that is nonsense. The expected string is not present. What is actually in the file?")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics V2")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "lyricsTest V2")
        #warning("COM is never detected. However, the garbled “ULT” tag is immediately followed by a “#[null]u” tag which gets discarded as invalid. The data that frame reports is a whopping 158206 bytes, and starting from the “u” in the tag name, it begins with “und”, two nulls and then “lyricsTest V2”. It seems the previous tag extends beyond its own declared end. Either the file was encoded wrong or I am working from the wrong specification. Either way, the root of the problem lies at the point when the frames themselves are split up, before individual frames are interpreted.")
        XCTAssertEqual(id3Tag?.frames[.Comment]?.id3Identifier, "COM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comment V2")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "commentTest V2")
        #warning("None of the following frames exist. Presumably they’re in the unparsable stuff after “ULT”.")
        XCTAssertEqual(id3Tag?.frames[.Language]?.id3Identifier, "TLA")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "TXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation V2")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPA")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
    }
    
    func testReadNewFramesV3() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version3)
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V3")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V3")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V3")
        XCTAssertEqual(id3Tag?.frames[.ContentGrouping]?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPOS")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesGrouping]?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V3")
        XCTAssertEqual(id3Tag?.frames[.MixArtist]?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V3")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V3")
        XCTAssertEqual(id3Tag?.frames[.FileOwner]?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesMovementName]?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesMovementIndex]?.id3Identifier, "MVIN")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual(id3Tag?.frames[.PodcastCategory]?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastDescription]?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastID]?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastKeywords]?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
        #warning("This appears to be the same sort of issue as version 2; “USLT” is followed by “#[null][null][null]”.")
        XCTAssertEqual(id3Tag?.frames[.UnsyncedLyrics]?.id3Identifier, "USLT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics V3")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "LyricsTest V3")
        XCTAssertEqual(id3Tag?.frames[.Comment]?.id3Identifier, "COMM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "CommentTest V3")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comments V3")
        XCTAssertEqual(id3Tag?.frames[.Language]?.id3Identifier, "TLAN")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "TXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation V3")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
    }
    
    func testReadNewFramesV4() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V4")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V4")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V4")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V4")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V4")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist V4")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V4")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V4")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.id3Identifier, "USLT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "LyricsTest V4")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics V4")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.id3Identifier, "COMM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "CommentTest V4")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comments V4")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.id3Identifier, "TLAN")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameWithStringContent)?.id3Identifier, "TXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation V4")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
    }
    
    //MARK: write
    
    func testWriteNewFramesV2() throws {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v2-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
          .appendingPathComponent("example-newframes-v2-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version2,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V2"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V2"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V2"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V2"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V2"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .FileType : ID3FrameWithStringContent(content: "FileType V2"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V2"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V2"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V2"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V2"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V2"),
                .Language : ID3FrameLanguage(language: .und),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "lyricsTest V2", content: "UnsyncedLyrics V2"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "commentTest V2", content: "Comment V2"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V2"),
            ]
        )

        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        let generated = try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))
        let expected = try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        #warning("We are comparing against the same corrupted file from the read tests.")
        XCTAssertEqual(
            generated,
            expected,
            generated.describeDifference(from: expected)
        )
    }
    
    func testWriteNewFramesV3() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v3-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
          .appendingPathComponent("example-newframes-v3-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V3"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V3"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileType : ID3FrameWithStringContent(content: "FileType V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V3"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V3"),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName V3"),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V3"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V3"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V3"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest V4", content: "UnsyncedLyrics V3"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest V3", content: "Comments V3"),
                .Language : ID3FrameLanguage(language: .und),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
    
    func testWriteNewFramesV4() {
        let pathMp3ToCompare = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        let generationURL = PathLoader.testOutputDirectory
          .appendingPathComponent("example-newframes-v4-generated.mp3")
        try? FileManager.default.removeItem(at: generationURL)
        let pathMp3Generated = generationURL.path
        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V4"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V4"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V4"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V4"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V4"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .FileType : ID3FrameWithStringContent(content: "FileType V4"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V4"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V4"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V4"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V4"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V4"),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName V4"),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V4"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V4"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V4"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V4"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V4"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V4"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V4"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest V4", content: "UnsyncedLyrics V4"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest V4", content: "Comments V4"),
                .Language : ID3FrameLanguage(language: .und),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        
        XCTAssertEqual(
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3Generated)),
            try! Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
        )
    }
}
