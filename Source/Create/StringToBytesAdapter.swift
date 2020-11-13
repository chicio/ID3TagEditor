//
//  StringToBytesAdapter.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol StringToBytesAdapter {
    func adapt(string: String, for version: ID3Version) -> [UInt8]
}
