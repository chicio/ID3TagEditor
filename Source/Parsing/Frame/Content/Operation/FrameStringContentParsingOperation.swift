//
//  FrameStringContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameStringContentParsingOperation {
    func parse(frame: Data, id3Tag: ID3Tag, finish: (String) -> ())
}
