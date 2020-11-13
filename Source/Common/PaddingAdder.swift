//
//  PaddingAdder.swift
//
//  Created by Fabrizio Duroni on 24/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol PaddingAdder {
    func addTo(content: [UInt8], numberOfByte: Int) -> [UInt8]
}
