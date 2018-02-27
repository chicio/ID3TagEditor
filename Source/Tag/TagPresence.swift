//
//  TagPresence.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol TagPresence {
    func isTagPresentIn(mp3: Data, version: ID3Version) -> Bool
}
