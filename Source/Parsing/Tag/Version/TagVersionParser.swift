//
//  TagVersionParser.swift
//  ID3Edit
//
//  Created by Fabrizio Duroni on 20.02.18.
//

import Foundation

protocol TagVersionParser {
    func parse(mp3: NSData) -> UInt8
}
