//
//  FrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameContentParsingOperation {
    func parse(frame: Data, id3Tag: ID3Tag)
}
