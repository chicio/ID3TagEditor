//
//  ID3UnsynchronisedLyricsFrameContentParsingOperation.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14/10/20.
//  2020 Fabrizio Duroni.
//

import Foundation


class ID3UnsynchronisedLyricsFrameContentParsingOperation: FrameContentParsingOperation {
    typealias Body = (contentDescriptor: String, content: String)
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let stringEncodingDetector: ID3FrameStringEncodingDetector
    private let paddingRemover: PaddingRemover

    init(id3FrameConfiguration: ID3FrameConfiguration,
         paddingRemover: PaddingRemover,
         stringEncodingDetector: ID3FrameStringEncodingDetector) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.stringEncodingDetector = stringEncodingDetector
        self.paddingRemover = paddingRemover
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> ()) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        let encoding = stringEncodingDetector.detect(frame: frame, version: version)
        let body = parseBodyFrom(frame: frame, using: headerSize, and: encoding)
        let language = parseLanguageFrom(frame: frame, using: headerSize)

        completed(.UnsynchronizedLyrics(language),
                  ID3FrameUnsynchronisedLyrics(language: language,
                                               contentDescription: body.contentDescriptor,
                                               content: body.content))
    }
    
    private func parseBodyFrom(frame: Data, using headerSize: Int, and encoding: String.Encoding) -> Body {
        let allContent = frame.subdata(in: headerSize + 4..<frame.count)
        let separatorRange = allContent.range(of: Data([0x00, 0x00, 0xFF, 0xFE]), options: .backwards) ?? Range(0...0)
        let contentDescriptor = String(bytes: allContent.subdata(in: 0..<separatorRange.startIndex), encoding: encoding) ?? "Invalid content"
        let content = String(bytes: allContent.subdata(in: separatorRange.endIndex - 2..<allContent.count), encoding: encoding) ?? "Invalid content"
        
        return (contentDescriptor: contentDescriptor, content: paddingRemover.removeFrom(string: content))
    }
    
    private func parseLanguageFrom(frame: Data, using headerSize: Int) -> ID3FrameContentLanguage {
        if let language = String(data: frame.subdata(in: headerSize + 1 ..< headerSize + 4), encoding: .utf8),
           let id3Language = ID3FrameContentLanguage(rawValue: language) {
            return id3Language
        }
        
        return .unknown
    }
}
