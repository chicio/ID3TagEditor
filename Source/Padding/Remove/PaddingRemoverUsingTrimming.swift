//
//  PaddingRemoverUsingTrimming.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class PaddingRemoverUsingTrimming: PaddingRemover {
    func removeFrom(string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet(charactersIn: "\0"))
    }
}
