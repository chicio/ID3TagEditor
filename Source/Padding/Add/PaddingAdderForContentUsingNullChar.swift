//
//  PaddingAdderForContentUsingNullChar.swift
//
//  Created by Fabrizio Duroni on 24/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class PaddingAdderUsingNullChar: PaddingAdder {
    func addTo(content: [UInt8]) -> [UInt8] {
        var newContent = content
        newContent.insert(0, at: 0)
        newContent.append(0)
        return newContent
    }
}
