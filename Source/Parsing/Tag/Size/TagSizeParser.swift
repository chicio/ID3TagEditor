//
//  TagSizeParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol TagSizeParser {
    func parse(data: NSData) -> UInt32
}
