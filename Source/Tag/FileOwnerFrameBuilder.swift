//
//  FileOwnerFrameBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public protocol FileOwnerFrameBuilder where Self: ID32TagCommonFramesBuilder {
    func fileOwner(frame: ID3FrameWithStringContent) -> Self
}

public extension FileOwnerFrameBuilder {
    func fileOwner(frame: ID3FrameWithStringContent) -> Self {
        frames[.fileOwner] = frame
        return self
    }
}
