//
//  ID3FrameFromStringContentCreator.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFromStringContentCreator: FrameFromStringContentCreator {
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let paddingAdder: PaddingAdder

    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         paddingAdder:PaddingAdder) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.paddingAdder = paddingAdder
    }

    func createFrame(frameIdentifier: [UInt8], version: ID3Version, content: String) -> [UInt8] {
        var frame: [UInt8] = frameIdentifier
        let contentAsBytes = paddingAdder.addTo(content:[UInt8](content.utf8))
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: contentAsBytes, version: version))
        frame.append(contentsOf: frameFlagsCreator.createFor(version: version))
        frame.append(contentsOf: contentAsBytes)
        return frame
    }
}
