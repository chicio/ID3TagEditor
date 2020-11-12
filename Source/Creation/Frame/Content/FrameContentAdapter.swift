//
//  FrameContentAdapter.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 12.11.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol FrameContentAdapter {
    func createFrames(id3Tag: ID3Tag, frameName: FrameName, frameType: FrameType) -> [UInt8]
}
