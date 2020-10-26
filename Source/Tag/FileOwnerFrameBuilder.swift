//
//  FileOwnerFrameBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 Protocol adopted by ID3Tag builders that support the .fileOwner (TOWN) frame. At the
 moment of this writing this frame is supported by ID3Tag version 3 and version 4 support .
 You should not adopt/use this protocol. Use ID32v4TagBuilder to create a ID3Tag version 4.
 */
public protocol FileOwnerFrameBuilder where Self: ID32TagCommonStringFramesBuilder {
    func fileOwner(frame: ID3FrameWithStringContent) -> Self
}

/**
 Default implementation for all the adopters of FileOwnerFrameBuilder. This extension let the adopters of
 FileOwnerFrameBuilder set the .fileOwner (TOWN) frame.
 */
public extension FileOwnerFrameBuilder {
    func fileOwner(frame: ID3FrameWithStringContent) -> Self {
        frames[.fileOwner] = frame
        return self
    }
}
