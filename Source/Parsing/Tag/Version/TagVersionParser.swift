//
//  TagVersionParser.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol TagVersionParser {
    func parse(mp3: Data) -> ID3Version
}
