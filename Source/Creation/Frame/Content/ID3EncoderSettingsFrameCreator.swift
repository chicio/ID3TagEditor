//
//  ID3EncoderSettingsFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3EncoderSettingsFrameCreator: ID3StringFrameCreator, ID3FrameCreator {
    func createFrames(id3Tag: ID3Tag) -> [UInt8] {
        if let encoderSettingsFrame = id3Tag.frames[.encoderSettings] as? ID3FrameWithStringContent {
            return createFrameUsing(
                frameType: .encoderSettings,
                content: encoderSettingsFrame.content,
                id3Tag: id3Tag)
        }
        return []
    }
}
