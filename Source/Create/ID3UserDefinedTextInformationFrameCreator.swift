//
//  ID3UserDefinedTextInformationFrameCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

protocol UserDefinedTextInformationFrameCreator {
    func createFrame(using frame: ID3FrameUserDefinedTextInformation, version: ID3Version, frameType: FrameType) -> [UInt8]
}

class ID3UserDefinedTextInformationFrameCreator: UserDefinedTextInformationFrameCreator {
    private let id3FrameConfiguration: ID3FrameConfiguration
    private let frameHeaderCreator: FrameHeaderCreator
    private let paddingAdder: PaddingAdder

    init(id3FrameConfiguration: ID3FrameConfiguration,
         frameHeaderCreator: FrameHeaderCreator,
         paddingAdder: PaddingAdder) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.frameHeaderCreator = frameHeaderCreator
        self.paddingAdder = paddingAdder
    }

    func createFrame(using frame: ID3FrameUserDefinedTextInformation, version: ID3Version, frameType: FrameType) -> [UInt8] {
        let encoding = selectEncoding(for: version)
        let stringEncoding = convertToStringEncoding(encoding, version: version)
        let encodingByte = id3FrameConfiguration.encodingByteFor(version: version, encoding: encoding)
        
        let descriptionBytes = [UInt8](frame.description.data(using: stringEncoding) ?? Data())
        let description = paddingAdder.addTo(content: descriptionBytes, numberOfByte: getTerminatorSize(for: stringEncoding))
        let content = [UInt8](frame.content.data(using: stringEncoding) ?? Data())
        
        let body = encodingByte + description + content
        let header = frameHeaderCreator.createUsing(version: version, frameType: frameType, frameBody: body)
        
        return header + body
    }
    
    private func selectEncoding(for version: ID3Version) -> ID3StringEncoding {
        return version == .version4 ? .UTF8 : .UTF16
    }
    
    private func convertToStringEncoding(_ id3Encoding: ID3StringEncoding, version: ID3Version) -> String.Encoding {
        let encodingMap: [ID3Version: [ID3StringEncoding: String.Encoding]] = [
            .version2: [.ISO88591: .isoLatin1, .UTF16: .utf16],
            .version3: [.ISO88591: .isoLatin1, .UTF16: .utf16],
            .version4: [.ISO88591: .isoLatin1, .UTF16: .utf16, .UTF8: .utf8]
        ]
        return encodingMap[version]?[id3Encoding] ?? .utf16
    }
    
    private func getTerminatorSize(for encoding: String.Encoding) -> Int {
        return encoding == .utf16 ? 2 : 1
    }
}