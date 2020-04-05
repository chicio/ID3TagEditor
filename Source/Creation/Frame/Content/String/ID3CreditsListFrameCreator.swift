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
        entries: [(role: String, person: String)]
    ) -> [UInt8] {
        var frameContents:[UInt8] = []
        frameContents.append(contentsOf: stringToBytesAdapter.encoding(for: version))
        
        for entry in entries {
            var rolePersonPair: [UInt8] = []
            let adaptedRole = stringToBytesAdapter.adapt(
                string: entry.role,
                for: version,
                includingEncoding: false,
                includingTermination: true
            )
            let adaptedPerson = stringToBytesAdapter.adapt(
                string: entry.person,
                for: version,
                includingEncoding: false,
                includingTermination: true
            )
            rolePersonPair.append(contentsOf: adaptedRole)
            rolePersonPair.append(contentsOf: adaptedPerson)
            frameContents.append(contentsOf: rolePersonPair)
        }
        
        return [UInt8](
            [
                frameIdentifier,
                frameContentSizeCalculator.calculateSizeOf(
                    content: frameContents,
                    version: version),
                frameFlagsCreator.createFor(version: version),
                frameContents
                ].joined()
        )
    }
}

