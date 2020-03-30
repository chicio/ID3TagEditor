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
        XCTAssertEqual(id3Tag?.frames[.Arranger]?.id3Identifier, "TP4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger V2")
        XCTAssertEqual(id3Tag?.frames[.ArtistUrl]?.id3Identifier, "WAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content, "http://V2ArtistUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioFileUrl]?.id3Identifier, "WAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content, "http://V2AudioFileUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioSourceUrl]?.id3Identifier, "WAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content, "http://V2AudioSourceUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V2")
        XCTAssertEqual(id3Tag?.frames[.BPM]?.id3Identifier, "TBP")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "BPM V2")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TP3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V2")
        XCTAssertEqual(id3Tag?.frames[.ContentGroup]?.id3Identifier, "TT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "ContentGroup V2")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCR")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V2")
        XCTAssertEqual(id3Tag?.frames[.CopyrightUrl]?.id3Identifier, "WCP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content, "http://V2CopyrightUrl.com")
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TEN")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V2")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSS")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V2")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V2")
        XCTAssertEqual(id3Tag?.frames[.InitialKey]?.id3Identifier, "TKE")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "Initial Key V2")
        XCTAssertEqual(id3Tag?.frames[.ISRC]?.id3Identifier, "TRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "ISRC V2")
        XCTAssertEqual(id3Tag?.frames[.Length]?.id3Identifier, "TLE")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "Length V2")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V2")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMT")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V2")
        XCTAssertEqual(id3Tag?.frames[.OriginalAlbum]?.id3Identifier, "TOT")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album V2")
        XCTAssertEqual(id3Tag?.frames[.OriginalArtist]?.id3Identifier, "TOA")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist V2")
        XCTAssertEqual(id3Tag?.frames[.OriginalFilename]?.id3Identifier, "TOF")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename V2")
        XCTAssertEqual(id3Tag?.frames[.OriginalLyricist]?.id3Identifier, "TOL")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist V2")
        XCTAssertEqual(id3Tag?.frames[.PlaylistDelay]?.id3Identifier, "TDY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "Playlist Delay V2")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V2")
        XCTAssertEqual(id3Tag?.frames[.PublisherUrl]?.id3Identifier, "WPB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content, "http://V2PublisherUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V2")
        XCTAssertEqual(id3Tag?.frames[.UnsyncedLyrics]?.id3Identifier, "ULT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics V2")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "lyricsTest V2")
        XCTAssertEqual(id3Tag?.frames[.Comment]?.id3Identifier, "COM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comment V2")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "commentTest V2")
        XCTAssertEqual(id3Tag?.frames[.Language]?.id3Identifier, "TLA")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "TXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation V2")
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "WXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content, "http://V2UserDefinedUrl.com")
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
        XCTAssertEqual(id3Tag?.frames[.Arranger]?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger V3")
        XCTAssertEqual(id3Tag?.frames[.ArtistUrl]?.id3Identifier, "WOAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.content, "http://V3ArtistUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioFileUrl]?.id3Identifier, "WOAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.content, "http://V3AudioFileUrl.com")
        XCTAssertEqual(id3Tag?.frames[.AudioSourceUrl]?.id3Identifier, "WOAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.content, "http://V3AudioSourceUrl.com")
        XCTAssertEqual(id3Tag?.frames[.BPM]?.id3Identifier, "TBPM")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "BPM V3")
        XCTAssertEqual(id3Tag?.frames[.Composer]?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V3")
        XCTAssertEqual(id3Tag?.frames[.Conductor]?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V3")
        XCTAssertEqual(id3Tag?.frames[.Copyright]?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V3")
        XCTAssertEqual(id3Tag?.frames[.CopyrightUrl]?.id3Identifier, "WCOP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.content, "http://V3CopyrightUrl.com")
        XCTAssertEqual(id3Tag?.frames[.ContentGroup]?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "ContentGroup V3")
        XCTAssertEqual(id3Tag?.frames[.DiscPosition]?.id3Identifier, "TPOS")
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
        XCTAssertEqual((id3Tag?.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
        XCTAssertEqual(id3Tag?.frames[.EncodedBy]?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V3")
        XCTAssertEqual(id3Tag?.frames[.EncoderSettings]?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V3")
        XCTAssertEqual(id3Tag?.frames[.InitialKey]?.id3Identifier, "TKEY")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "Initial Key V3")
        XCTAssertEqual(id3Tag?.frames[.ISRC]?.id3Identifier, "TSRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "ISRC V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesGrouping]?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V3")
        XCTAssertEqual(id3Tag?.frames[.Length]?.id3Identifier, "TLEN")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "Length V3")
        XCTAssertEqual(id3Tag?.frames[.Lyricist]?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V3")
        XCTAssertEqual(id3Tag?.frames[.MediaType]?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V3")
        XCTAssertEqual(id3Tag?.frames[.FileType]?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V3")
        XCTAssertEqual(id3Tag?.frames[.FileOwner]?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesMovementName]?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V3")
        XCTAssertEqual(id3Tag?.frames[.ITunesMovementIndex]?.id3Identifier, "MVIN")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual(id3Tag?.frames[.OriginalAlbum]?.id3Identifier, "TOAL")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album V3")
        XCTAssertEqual(id3Tag?.frames[.OriginalArtist]?.id3Identifier, "TOPE")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist V3")
        XCTAssertEqual(id3Tag?.frames[.OriginalFilename]?.id3Identifier, "TOFN")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename V3")
        XCTAssertEqual(id3Tag?.frames[.OriginalLyricist]?.id3Identifier, "TOLY")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist V3")
        XCTAssertEqual(id3Tag?.frames[.PlaylistDelay]?.id3Identifier, "TDLY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "Playlist Delay V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastCategory]?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastDescription]?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastID]?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastKeywords]?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V3")
        XCTAssertEqual(id3Tag?.frames[.PodcastUrl]?.id3Identifier, "WFED")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.content, "http://V3PodcastUrl.com")
        XCTAssertEqual(id3Tag?.frames[.Publisher]?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V3")
        XCTAssertEqual(id3Tag?.frames[.PublisherUrl]?.id3Identifier, "WPUB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.content, "http://V3PublisherUrl.com")
        XCTAssertEqual(id3Tag?.frames[.RadioStation]?.id3Identifier, "TRSN")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.content, "Radio Station V3")
        XCTAssertEqual(id3Tag?.frames[.RadioStationOwner]?.id3Identifier, "TRSO")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.content, "Radio Station Owner V3")
        XCTAssertEqual(id3Tag?.frames[.RadioStationUrl]?.id3Identifier, "WORS")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.content, "http://V3RadioStationUrl.com")
        XCTAssertEqual(id3Tag?.frames[.SortAlbum]?.id3Identifier, "TSOA")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.content, "Sort Album V3")
        XCTAssertEqual(id3Tag?.frames[.SortAlbumArtist]?.id3Identifier, "TSO2")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.content, "Sort Album Artist V3")
        XCTAssertEqual(id3Tag?.frames[.SortArtist]?.id3Identifier, "TSOP")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.content, "Sort Artist V3")
        XCTAssertEqual(id3Tag?.frames[.SortComposer]?.id3Identifier, "TSOC")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.content, "Sort Composer V3")
        XCTAssertEqual(id3Tag?.frames[.SortTitle]?.id3Identifier, "TSOT")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.content, "Sort Title V3")
        XCTAssertEqual(id3Tag?.frames[.Subtitle]?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V3")
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
        XCTAssertEqual(id3Tag?.frames[.UserDefinedTextInformation]?.id3Identifier, "WXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "http://V3UserDefinedUrl.com")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
    }
    
    func testReadNewFramesV4() throws {
        let path = PathLoader().pathFor(name: "example-newframes-v4-written", fileType: "mp3")
        // See testReadNewFramesV2 for an explanation of the duplication.
        _ = try? id3TagEditor.read(from: path)
        let id3Tag = try id3TagEditor.read(from: path)
        
        XCTAssertEqual(id3Tag?.properties.version, .version4)
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.id3Identifier, "TPE4")
        XCTAssertEqual((id3Tag?.frames[.Arranger] as? ID3FrameWithStringContent)?.content, "Arranger V4")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAR")
        XCTAssertEqual((id3Tag?.frames[.ArtistUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4ArtistUrl.com")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAF")
        XCTAssertEqual((id3Tag?.frames[.AudioFileUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4AudioFileUrl.com")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WOAS")
        XCTAssertEqual((id3Tag?.frames[.AudioSourceUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4AudioSourceUrl.com")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.id3Identifier, "TBPM")
        XCTAssertEqual((id3Tag?.frames[.BPM] as? ID3FrameWithStringContent)?.content, "BPM V4")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.id3Identifier, "COMM")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.description, "CommentTest V4")
        XCTAssertEqual((id3Tag?.frames[.Comment] as? ID3FrameCommentTypes)?.content, "Comments V4")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.id3Identifier, "TCOM")
        XCTAssertEqual((id3Tag?.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer V4")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.id3Identifier, "TPE3")
        XCTAssertEqual((id3Tag?.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor V4")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.id3Identifier, "TCOP")
        XCTAssertEqual((id3Tag?.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright V4")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WCOP")
        XCTAssertEqual((id3Tag?.frames[.CopyrightUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4CopyrightUrl.com")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.id3Identifier, "TIT1")
        XCTAssertEqual((id3Tag?.frames[.ContentGroup] as? ID3FrameWithStringContent)?.content, "ContentGroup V4")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.id3Identifier, "TENC")
        XCTAssertEqual((id3Tag?.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy V4")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.id3Identifier, "TSSE")
        XCTAssertEqual((id3Tag?.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings V4")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TOWN")
        XCTAssertEqual((id3Tag?.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner V4")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.id3Identifier, "TFLT")
        XCTAssertEqual((id3Tag?.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType V4")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.id3Identifier, "TKEY")
        XCTAssertEqual((id3Tag?.frames[.InitialKey] as? ID3FrameWithStringContent)?.content, "InitialKey V4")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.id3Identifier, "TSRC")
        XCTAssertEqual((id3Tag?.frames[.ISRC] as? ID3FrameWithStringContent)?.content, "ISRC V4")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.id3Identifier, "GRP1")
        XCTAssertEqual((id3Tag?.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "ItunesGrouping V4")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.id3Identifier, "MVNM")
        XCTAssertEqual((id3Tag?.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName V4")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.id3Identifier, "TLAN")
        XCTAssertEqual((id3Tag?.frames[.Language] as? ID3FrameLanguage)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.id3Identifier, "TLEN")
        XCTAssertEqual((id3Tag?.frames[.Length] as? ID3FrameWithStringContent)?.content, "Length V4")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TEXT")
        XCTAssertEqual((id3Tag?.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist V4")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.id3Identifier, "TMED")
        XCTAssertEqual((id3Tag?.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType V4")
        XCTAssertEqual((id3Tag?.frames[.Mood] as? ID3FrameWithStringContent)?.id3Identifier, "TMOO")
        XCTAssertEqual((id3Tag?.frames[.Mood] as? ID3FrameWithStringContent)?.content, "Mood V4")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.id3Identifier, "TOAL")
        XCTAssertEqual((id3Tag?.frames[.OriginalAlbum] as? ID3FrameWithStringContent)?.content, "Original Album V4")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TOPE")
        XCTAssertEqual((id3Tag?.frames[.OriginalArtist] as? ID3FrameWithStringContent)?.content, "Original Artist V4")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.id3Identifier, "TOFN")
        XCTAssertEqual((id3Tag?.frames[.OriginalFilename] as? ID3FrameWithStringContent)?.content, "Original Filename V4")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.id3Identifier, "TOLY")
        XCTAssertEqual((id3Tag?.frames[.OriginalLyricist] as? ID3FrameWithStringContent)?.content, "Original Lyricist V4")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.id3Identifier, "TDLY")
        XCTAssertEqual((id3Tag?.frames[.PlaylistDelay] as? ID3FrameWithStringContent)?.content, "Playlist Delay V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.id3Identifier, "TCAT")
        XCTAssertEqual((id3Tag?.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.id3Identifier, "TDES")
        XCTAssertEqual((id3Tag?.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.id3Identifier, "TGID")
        XCTAssertEqual((id3Tag?.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.id3Identifier, "TKWD")
        XCTAssertEqual((id3Tag?.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords V4")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WFED")
        XCTAssertEqual((id3Tag?.frames[.PodcastUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4PodcastUrl.com")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.id3Identifier, "TPUB")
        XCTAssertEqual((id3Tag?.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher V4")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WPUB")
        XCTAssertEqual((id3Tag?.frames[.PublisherUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4PublisherUrl.com")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.id3Identifier, "TRSN")
        XCTAssertEqual((id3Tag?.frames[.RadioStation] as? ID3FrameWithStringContent)?.content, "Radio Station V4")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.id3Identifier, "TRSO")
        XCTAssertEqual((id3Tag?.frames[.RadioStationOwner] as? ID3FrameWithStringContent)?.content, "Radio Station Owner V4")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.id3Identifier, "WORS")
        XCTAssertEqual((id3Tag?.frames[.RadioStationUrl] as? ID3FrameWithStringContent)?.id3Identifier, "http://www.V4RadioStationUrl.com")
        XCTAssertEqual((id3Tag?.frames[.SetSubtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TSST")
        XCTAssertEqual((id3Tag?.frames[.SetSubtitle] as? ID3FrameWithStringContent)?.content, "Set Subtitle V4")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.id3Identifier, "TSOA")
        XCTAssertEqual((id3Tag?.frames[.SortAlbum] as? ID3FrameWithStringContent)?.content, "Sort Album V4")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TSO2")
        XCTAssertEqual((id3Tag?.frames[.SortAlbumArtist] as? ID3FrameWithStringContent)?.content, "Sort Album Artist V4")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.id3Identifier, "TSOP")
        XCTAssertEqual((id3Tag?.frames[.SortArtist] as? ID3FrameWithStringContent)?.content, "Sort Artist V4")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.id3Identifier, "TSOC")
        XCTAssertEqual((id3Tag?.frames[.SortComposer] as? ID3FrameWithStringContent)?.content, "Sort Composer V4")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.id3Identifier, "TSOT")
        XCTAssertEqual((id3Tag?.frames[.SortTitle] as? ID3FrameWithStringContent)?.content, "Sort Title V4")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.id3Identifier, "TIT3")
        XCTAssertEqual((id3Tag?.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle V4")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.id3Identifier, "USLT")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.language, .und)
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.description, "LyricsTest V4")
        XCTAssertEqual((id3Tag?.frames[.UnsyncedLyrics] as? ID3FrameCommentTypes)?.content, "UnsyncedLyrics V4")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.id3Identifier, "TXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.content, "UserDefinedTextInformation V4")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "description")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.id3Identifier, "WXXX")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedUrl] as? ID3FrameUserDefinedText)?.content, "http://V4UserDefinedUrl.com")
        XCTAssertEqual((id3Tag?.frames[.UserDefinedTextInformation] as? ID3FrameUserDefinedText)?.description, "UserDefinedUrl")
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
                .Arranger : ID3FrameWithStringContent(content: "Arranger V2"),
                .ArtistUrl : ID3FrameWithStringContent(content: "http://V2ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://V2AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://V2AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "BPM V2"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "commentTest V2", content: "Comment V2"),
                .Composer : ID3FrameWithStringContent(content: "Composer V2"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V2"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup V2"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V2"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://V2CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V2"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V2"),
                .FileType : ID3FrameWithStringContent(content: "FileType V2"),
                .InitialKey : ID3FrameWithStringContent(content: "Initial Key V2"),
                .ISRC : ID3FrameWithStringContent(content: "ISRC V2"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "Length V2"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V2"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V2"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album V2"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist V2"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename V2"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist V2"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay V2"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V2"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://V2PublisherUrl.com"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V2"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "lyricsTest V2", content: "UnsyncedLyrics V2"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V2"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://V2UserDefinedUrl.com"),

            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: PathLoader().pathFor(name: "example-newframes", fileType: "mp3"),
            andSaveTo: pathMp3Generated
            ))
        let generated = try Data(contentsOf: URL(fileURLWithPath: pathMp3Generated))
        let expected = try Data(contentsOf: URL(fileURLWithPath: pathMp3ToCompare))
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
                .Arranger : ID3FrameWithStringContent(content: "Arranger V3"),
                .ArtistUrl : ID3FrameWithStringContent(content: "http://V3ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://V3AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://V3AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "BPM V3"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest V3", content: "Comments V3"),
                .Composer : ID3FrameWithStringContent(content: "Composer V3"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V3"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://V3CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileType : ID3FrameWithStringContent(content: "FileType V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .InitialKey : ID3FrameWithStringContent(content: "Initial Key V3"),
                .ISRC : ID3FrameWithStringContent(content: "ISRC V3"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName V3"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "Length V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V3"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album V3"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist V3"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename V3"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist V3"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay V3"),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V3"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V3"),
                .PodcastUrl : ID3FrameWithStringContent(content: "http://V3PodcastUrl.com"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://V3PublisherUrl.com"),
                .RadioStation : ID3FrameWithStringContent(content: "Radio Station V3"),
                .RadioStationOwner : ID3FrameWithStringContent(content: "Radio Station Owner V3"),
                .RadioStationUrl : ID3FrameWithStringContent(content: "http://V3RadioStationUrl.com"),
                .SortAlbum : ID3FrameWithStringContent(content: "Sort Album V3"),
                .SortArtist : ID3FrameWithStringContent(content: "Sort Artist V3"),
                .SortAlbumArtist : ID3FrameWithStringContent(content: "Sort Album Artist V3"),
                .SortComposer : ID3FrameWithStringContent(content: "Sort Composer V3"),
                .SortTitle : ID3FrameWithStringContent(content: "Sort Title V3"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest V3", content: "UnsyncedLyrics V3"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V3"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://V3UserDefinedUrl.com"),
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
                .Arranger : ID3FrameWithStringContent(content: "Arranger V4"),
                .ArtistUrl : ID3FrameWithStringContent(content: "http://V4ArtistUrl.com"),
                .AudioFileUrl : ID3FrameWithStringContent(content: "http://V4AudioFileUrl.com"),
                .AudioSourceUrl : ID3FrameWithStringContent(content: "http://V4AudioSourceUrl.com"),
                .BPM : ID3FrameWithStringContent(content: "BPM V4"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "CommentTest V4", content: "Comments V4"),
                .Composer : ID3FrameWithStringContent(content: "Composer V4"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V4"),
                .ContentGroup : ID3FrameWithStringContent(content: "ContentGroup V4"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V4"),
                .CopyrightUrl : ID3FrameWithStringContent(content: "http://V4CopyrightUrl.com"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V4"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V4"),
                .FileType : ID3FrameWithStringContent(content: "FileType V4"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V4"),
                .InitialKey : ID3FrameWithStringContent(content: "InitialKey V4"),
                .ISRC : ID3FrameWithStringContent(content: "ISRC V4"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "ItunesGrouping V4"),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 13),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 6),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName V4"),
                .Language : ID3FrameLanguage(language: .und),
                .Length : ID3FrameWithStringContent(content: "Length V4"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V4"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V4"),
                .Mood : ID3FrameWithStringContent(content: "Mood V4"),
                .OriginalAlbum : ID3FrameWithStringContent(content: "Original Album V4"),
                .OriginalArtist : ID3FrameWithStringContent(content: "Original Artist V4"),
                .OriginalFilename : ID3FrameWithStringContent(content: "Original Filename V4"),
                .OriginalLyricist : ID3FrameWithStringContent(content: "Original Lyricist V4"),
                .PlaylistDelay : ID3FrameWithStringContent(content: "Playlist Delay V4"),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V4"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V4"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V4"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V4"),
                .PodcastUrl : ID3FrameWithStringContent(content: "http://V4PodcastUrl.com"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V4"),
                .PublisherUrl : ID3FrameWithStringContent(content: "http://V4PublisherUrl.com"),
                .RadioStation : ID3FrameWithStringContent(content: "Radio Station V4"),
                .RadioStationOwner : ID3FrameWithStringContent(content: "Radio Station Owner V4"),
                .RadioStationUrl : ID3FrameWithStringContent(content: "http://V4RadioStationUrl.com"),
                .SetSubtitle : ID3FrameWithStringContent(content: "Set Subtitle V4"),
                .SortAlbum : ID3FrameWithStringContent(content: "Sort Album V4"),
                .SortAlbumArtist : ID3FrameWithStringContent(content: "Sort Album Artist V4"),
                .SortArtist : ID3FrameWithStringContent(content: "Sort Artist V4"),
                .SortComposer : ID3FrameWithStringContent(content: "Sort Composer V4"),
                .SortTitle : ID3FrameWithStringContent(content: "Sort Title V4"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V4"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "LyricsTest V4", content: "UnsyncedLyrics V4"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "description", content: "UserDefinedTextInformation V4"),
                .UserDefinedUrl : ID3FrameUserDefinedText(description: "UserDefinedUrl", content: "http://V4UserDefinedUrl.com"),
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
