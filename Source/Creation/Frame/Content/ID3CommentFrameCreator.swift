//
//  ID3CommentFrameCreator.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3CommentFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: CommentTypesFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: CommentTypesFrameCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let commentFrame = id3Tag.frames[.Comment] as? ID3FrameCommentTypes {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .Comment,
                        version: id3Tag.properties.version
                    ),
                    version: id3Tag.properties.version, language: commentFrame.language, description: commentFrame.description,
                    content: adapt(comment: commentFrame)
            )
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
    
    private func adapt(comment: ID3FrameCommentTypes) -> String {
        var commentString = ""
        let language = comment.language
        commentString = commentString + "\(language)"
        if let description = comment.description {
            commentString = commentString + "\(description)"
        }
        commentString = commentString + "\(comment.content)"
        return commentString
    }
}
