//
//  ID3FrameFromURLStringContentCreator.swift
//
//  Created by NolaineCrusher on 03/30/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameFromURLStringContentCreator: FrameFromStringContentCreator {
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let stringToBytesAdapter: StringToBytesAdapter

    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         stringToBytesAdapter: StringToBytesAdapter) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.stringToBytesAdapter = stringToBytesAdapter
    }

    func createFrame(frameIdentifier: [UInt8], version: ID3Version, content: String) -> [UInt8] {
        var frame: [UInt8] = frameIdentifier
        let contentAsBytes = stringToBytesAdapter.adapt(stringOnly: content)
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: contentAsBytes, version: version))
        frame.append(contentsOf: frameFlagsCreator.createFor(version: version))
        frame.append(contentsOf: contentAsBytes)
        return frame
    }
}
