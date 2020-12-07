//
//  ID3LocalizedFrameParsingOperation.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 14.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

class ID3LocalizedFrameContentParsingOperation: FrameContentParsingOperation {
    typealias Body = (contentDescriptor: String, content: String)
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let stringEncodingDetector: ID3FrameStringEncodingDetector
    private let paddingRemover: PaddingRemover
    private let frameName: (ID3FrameContentLanguage) -> FrameName

    init(id3FrameConfiguration: ID3FrameConfiguration,
         paddingRemover: PaddingRemover,
         stringEncodingDetector: ID3FrameStringEncodingDetector,
         frameName: @escaping (ID3FrameContentLanguage) -> FrameName) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.stringEncodingDetector = stringEncodingDetector
        self.paddingRemover = paddingRemover
        self.frameName = frameName
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        let encoding = stringEncodingDetector.detect(frame: frame, version: version)
        let body = parseBodyFrom(frame: frame, using: headerSize, and: encoding)
        let language = parseLanguageFrom(frame: frame, using: headerSize)
        let frame = ID3FrameWithLocalizedContent(language: language,
                                                 contentDescription: body.contentDescriptor,
                                                 content: body.content)
        completed(frameName(language), frame)
    }

    private func parseBodyFrom(frame: Data, using headerSize: Int, and encoding: String.Encoding) -> Body {
        let allContent = frame.subdata(in: headerSize + 4..<frame.count)
        let separatorRange = calculateSeparatorRange(allContent: allContent, encoding: encoding)
        let contentDescriptor = String(
            bytes: allContent.subdata(in: 0..<separatorRange.startIndex),
            encoding: encoding
        ) ?? "Invalid content"
        let content = String(
            bytes: allContent.subdata(in: contentStartIndexFrom(separatorRange: separatorRange)..<allContent.count),
            encoding: encoding
        ) ?? "Invalid content"

        return (contentDescriptor: contentDescriptor, content: paddingRemover.removeFrom(string: content))
    }

    private func calculateSeparatorRange(allContent: Data, encoding: String.Encoding) -> Range<Data.Index> {
        return allContent.range(of: Data(getSeparatorUsing(encoding: encoding)), options: .backwards) ?? Range(0...0)
    }

    private func getSeparatorUsing(encoding: String.Encoding) -> [UInt8] {
        return encoding == String.Encoding.utf16 ? [0x00, 0x00, 0xFF, 0xFE] : [0x00, 0x00]
    }

    private func contentStartIndexFrom(separatorRange: Range<Int>) -> Int {
        return separatorRange.endIndex >= 2 ? separatorRange.endIndex - 2 : 0
    }

    private func parseLanguageFrom(frame: Data, using headerSize: Int) -> ID3FrameContentLanguage {
        if let language = String(data: frame.subdata(in: headerSize + 1 ..< headerSize + 4), encoding: .utf8),
           let id3Language = ID3FrameContentLanguage(rawValue: language) {
            return id3Language
        }

        return .unknown
    }
}
