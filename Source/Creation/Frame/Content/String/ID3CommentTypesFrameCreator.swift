//
//  ID3CommentTypesFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3CommentTypesFrameCreator: CommentTypesFrameCreator {
    
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

    func createFrame(frameIdentifier: [UInt8], version: ID3Version, language: ISO_639_2_Codes, description: String?, content: String) -> [UInt8] {
        var frame: [UInt8] = frameIdentifier

        let languageAsBytes = stringToBytesAdapter.adapt(string: language.rawValue, for: version)
        let terminatedString = String(decoding: (description?.nullTerminated)!, as: UTF8.self)
        let descriptionAsBytes = stringToBytesAdapter.adapt(string: terminatedString, for: version)
        let contentAsBytes = stringToBytesAdapter.adapt(string: content, for: version)

        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: languageAsBytes, version: version))
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: descriptionAsBytes, version: version))
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: contentAsBytes, version: version))

        frame.append(contentsOf: frameFlagsCreator.createFor(version: version))
        frame.append(contentsOf: languageAsBytes)
        frame.append(contentsOf: descriptionAsBytes)
        frame.append(contentsOf: contentAsBytes)
        return frame
    }
}

