//
//  TagSizeParser.swift
//  ID3Edit
//
//  Created by Fabrizio Duroni on 21.02.18.
//

import Foundation

protocol TagSizeParser {
    func parse(data: NSData) -> UInt32
}
