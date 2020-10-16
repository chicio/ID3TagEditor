//
//  PathLoader.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 04/03/2018.
//  2018 Fabrizio Duroni
//

import Foundation

class PathLoader {
    func pathFor(name: String, fileType: String) -> String {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: name, ofType: fileType)!
        return path
    }
}
