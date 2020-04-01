//
//  ID3FrameFromURLStringContentCreator.swift
//
//  Created by Nolaine Crusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFromBooleanContentCreator: FrameFromBooleanContentCreator {
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    
    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
    }
    
    func createFrame(frameIdentifier: [UInt8], version: ID3Version, value: Bool) -> [UInt8] {
        var frame: [UInt8] = frameIdentifier
        var contentAsBytes: [UInt8] = []
        if value == true {
            contentAsBytes = [0x00, 0x00, 0x00, 0x01]
        } else {
            contentAsBytes = [0x00, 0x00, 0x00, 0x00]
        }
        frame.append(
            contentsOf: frameContentSizeCalculator.calculateSizeOf(
                content: contentAsBytes,
                version: version))
        frame.append(
            contentsOf: frameFlagsCreator.createFor(
                version: version))
        frame.append(contentsOf: contentAsBytes)
        return frame
    }
}
