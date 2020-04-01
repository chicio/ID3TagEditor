//
//  ID3CommentTypesFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/// This is used simultaniously by the comment and user text frame archetypes. The two differ only by the presence of a language, so the frame itself can easily determine the output by providing a language or specifying `nil`.
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
    
    func createFrame(
        frameIdentifier: [UInt8],
        version: ID3Version,
        language: ISO_639_2_Codes?,
        description: String?,
        content: String
    ) -> [UInt8] {
        let frameContents = [UInt8](
            [
                stringToBytesAdapter.encoding(for: version),
                // User text frames specify `nil` to leave the language out.
                language.map({ Array($0.rawValue.utf8) }) ?? [], // Actually ASCII, but for that range UTF‐8 is the same.
                stringToBytesAdapter.adapt(
                    string: description ?? "",
                    for: version,
                    includingEncoding: false,
                    includingTermination: true
                ),
                stringToBytesAdapter.adapt(
                    string: content,
                    for: version,
                    includingEncoding: false,
                    includingTermination: false
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

