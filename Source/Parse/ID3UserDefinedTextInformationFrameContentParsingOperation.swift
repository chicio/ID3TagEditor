//
//  ID3UserDefinedTextInformationFrameContentParsingOperation.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

class ID3UserDefinedTextInformationFrameContentParsingOperation: FrameContentParsingOperation {
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

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void) {
        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        let encoding = stringEncodingDetector.detect(frame: frame, version: version)
        let (description, content) = parseBodyFrom(frame: frame, using: headerSize, and: encoding)
        let userDefinedFrame = ID3FrameUserDefinedTextInformation(description: description, content: content)
        completed(.userDefinedTextInformation(description), userDefinedFrame)
    }

    private func parseBodyFrom(frame: Data, using headerSize: Int, and encoding: String.Encoding) -> (String, String) {
        let encodingSize = id3FrameConfiguration.encodingSize()
        let frameContentStartIndex = headerSize + encodingSize
        let allContent = frame.subdata(in: frameContentStartIndex..<frame.count)
        
        if encoding == .utf16 {
            return parseUTF16Content(allContent)
        } else {
            return parseNonUTF16Content(allContent, encoding: encoding)
        }
    }
    
    private func parseUTF16Content(_ data: Data) -> (String, String) {
        // For UTF-16, we need to handle the BOM and find the actual null terminator
        var currentIndex = 0
        
        // Skip BOM if present
        if data.count >= 2 && data[0] == 0xFF && data[1] == 0xFE {
            currentIndex = 2
        }
        
        // Find the null terminator (00 00)
        var descriptionEnd = currentIndex
        while descriptionEnd < data.count - 1 {
            if data[descriptionEnd] == 0x00 && data[descriptionEnd + 1] == 0x00 {
                break
            }
            descriptionEnd += 2 // UTF-16 uses 2 bytes per character
        }
        
        // Extract description (including BOM if present)
        let descriptionData = data.subdata(in: 0..<descriptionEnd)
        let description = String(data: descriptionData, encoding: .utf16) ?? ""
        
        // Skip past the null terminator
        let contentStart = descriptionEnd + 2
        
        // Extract content (rest of the data)
        let contentData = data.subdata(in: contentStart..<data.count)
        let content = String(data: contentData, encoding: .utf16) ?? ""
        
        return (paddingRemover.removeFrom(string: description), paddingRemover.removeFrom(string: content))
    }
    
    private func parseNonUTF16Content(_ data: Data, encoding: String.Encoding) -> (String, String) {
        let separatorBytes = Data([0x00])
        guard let separatorRange = data.range(of: separatorBytes) else {
            // If no separator found, treat all as description with empty content
            let description = String(data: data, encoding: encoding) ?? ""
            return (paddingRemover.removeFrom(string: description), "")
        }
        
        let description = String(
            data: data.subdata(in: 0..<separatorRange.lowerBound),
            encoding: encoding
        ) ?? ""
        
        let valueStartIndex = separatorRange.upperBound
        let content = String(
            data: data.subdata(in: valueStartIndex..<data.count),
            encoding: encoding
        ) ?? ""

        return (paddingRemover.removeFrom(string: description), paddingRemover.removeFrom(string: content))
    }

    private func getSeparatorUsing(encoding: String.Encoding) -> [UInt8] {
        return encoding == String.Encoding.utf16 ? [0x00, 0x00] : [0x00]
    }
}