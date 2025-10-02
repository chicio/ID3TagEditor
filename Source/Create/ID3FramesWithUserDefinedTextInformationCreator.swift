//
//  ID3FramesWithUserDefinedTextInformationCreator.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation

class ID3FramesWithUserDefinedTextInformationCreator: ID3FrameCreator {
    private let userDefinedTextInformationFrameCreator: UserDefinedTextInformationFrameCreator

    init(userDefinedTextInformationFrameCreator: UserDefinedTextInformationFrameCreator) {
        self.userDefinedTextInformationFrameCreator = userDefinedTextInformationFrameCreator
    }

    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        return id3Tag.frames.reduce([], { accumulator, frameElement in
            if case .userDefinedTextInformation(_) = frameElement.key,
               let frame = frameElement.value as? ID3FrameUserDefinedTextInformation {
                return accumulator + userDefinedTextInformationFrameCreator.createFrame(
                    using: frame,
                    version: id3Tag.properties.version,
                    frameType: .userDefinedTextInformation
                )
            }
            return accumulator
        })
    }
}