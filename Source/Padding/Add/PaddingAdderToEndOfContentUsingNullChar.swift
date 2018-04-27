//
//  PaddingAdderToEndOfContentUsingNullChar.swift
//
//  Created by Fabrizio Duroni on 24/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class PaddingAdderToEndOfContentUsingNullChar: PaddingAdder {
    func addTo(content: [UInt8], numberOfByte: Int) -> [UInt8] {
        var newContent = content
        newContent.append(contentsOf: [UInt8](repeating: 0, count: numberOfByte))
        return newContent
    }
}
