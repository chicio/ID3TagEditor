//
//  ID3CreditsListFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 4/2/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3CreditsListFrameCreator: CreditsListFrameCreator {
    
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
    
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        role: String,
        person: String
    ) -> [UInt8] {
        let frameContents = [UInt8](
            [
                stringToBytesAdapter.adapt(
                    string: role,
                    for: version,
                    includingEncoding: true,
                    includingTermination: true
                ),
                stringToBytesAdapter.adapt(
                    string: person,
                    for: version,
                    includingEncoding: false,
                    includingTermination: true
                )
                ].joined()
        )
        
        return [UInt8](
            [
                frameIdentifier,
                frameContentSizeCalculator.calculateSizeOf(
                    content: frameContents, version: version),
                frameFlagsCreator.createFor(version: version),
                frameContents
                ].joined()
        )
    }
}

