//
//  PathLoader.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class PathLoader {
    func pathFor(name: String, fileType: String) -> String {
        return Bundle.module.path(forResource: name, ofType: fileType)!
    }
}
