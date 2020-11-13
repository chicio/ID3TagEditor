//
//  FrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameContentParsingOperation {
    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void)
}
